# 以檔案名稱寫入資料庫

from utils.mysql_lib import stations_table, basic_table, tables, engine
from utils.mysql_lib import select_all_from_table, upsert_with_values, insert_with_values
from utils.my_lib import loadJson
from pathlib import Path
import pandas as pd
import numpy as np
from airflow.decorators import task

from sqlalchemy.exc import IntegrityError

@task
def update_data():

    # 資料存放的位置
    data_dir = Path("data")
    # 獲取每個json檔案的路徑
    # json_files = data_dir.rglob("*.json")
    # json_files = sorted(data_dir.rglob("*.json"), key=lambda p: str(p))  # 依照路徑字母排序
    json_files = sorted(
        (
            p for p in data_dir.rglob("*.json")
            if not p.name.startswith("Z_")  # 排除 Z 開頭
        ),
        key=lambda p: (
            0 if "basic_li" in p.parts else 1,  # "basic_li" 優先
            str(p)                              # 字母順序
        )
    )

    # 把每個檔案寫入資料庫
    # 因為有station外件約束，如果遇到錯誤要先更新測站資料
    # 有4種表，以路徑名稱分開執行
    count = 0
    for file_path in json_files:
        count += update_from_json(file_path)

    print(f"共處理了 {count} 個檔案")
    return


# 格式化資料
def data_NF(file_path:Path):
    """讀取檔案為json，標準統一欄位後回傳DataFrame"""
    data = loadJson(file_path)

    # 空df準備加入資料
    df_records = pd.DataFrame()
    for records in data:
        df = pd.DataFrame(records["Records"])
        # 統一時間戳記欄位名稱
        df["DTIME"] = records["DTIME"]
        # 統一唯一鍵名稱
        if 'ID' in df.columns and 'key_ID' not in df.columns:
            df.rename(columns={'ID': 'key_ID'}, inplace=True)
        # 風力相關
        if "wind_speed_mean" in df.columns:
            # 去除風力級數
            df["wind_speed_mean"] = df["wind_speed_mean"].str.extract(r'([\d.]+)').astype(float)
            # 把風向方位化為數字角度
            direction_map = {
                "北": 0, "北北東": 23, "東北": 45, "東北東": 68,
                "東": 90, "東南東": 113, "東南": 135, "南南東": 158,
                "南": 180, "南南西": 203, "西南": 225, "西南西": 248,
                "西": 270, "西北西": 293, "西北": 315, "北北西": 338,
                "-":None,
                "－":None,
                "靜風": None,
            }
            df["wind_dir_max"] = df["wind_dir_max"].apply(lambda x: direction_map.get(x, x))
        # 統一繁簡
        df = df.replace('台', '臺', regex=True)
        # 取代空自串為None
        df = df.replace("", None)
        df = df.replace("-", None)
        # 串接所有資料
        df_records = pd.concat([df_records, df], ignore_index=True)
    
    df_records = df_records.replace({np.nan: None})

    return df_records


def update_stations(file_path):
    if "basic" not in str(file_path):
        print("更新測站資料有誤，請載入basic資料")
        return
    df_stations = data_NF(file_path)
    df_db_stations = select_all_from_table(tables["stations"])

    # 去除重複的資料
    df_stations = df_stations.drop_duplicates(subset='key_ID', keep='first')

    # 取得欄位名稱交集
    common_columns = df_db_stations.columns.intersection(df_stations.columns)
    # 只保留 df 的交集欄位
    df_common = df_stations[common_columns]
    # 根據 key_ID 欄位取差集（df_B 的 Key_ID 中不在 df_A 的 Key_ID）
    diff_key_ids = df_common[~df_common['key_ID'].isin(df_db_stations['key_ID'])]
    # diff_key_ids = diff_key_ids.replace({np.nan: None})
    # diff_key_ids = diff_key_ids.head(5)
    # print(diff_key_ids)
    stmt = upsert_with_values(tables["stations"], diff_key_ids.to_dict(orient='records'))
    # compiled = stmt.compile(engine, compile_kwargs={"literal_binds": True})
    # print(str(compiled))
    if stmt is None:
        print("沒有資料")
        return

    with engine.begin() as conn:
        result = conn.execute(stmt)
        print(f"測站資料寫入：{result.rowcount}")
    return

def upsert_data(table, value):
    stmt = upsert_with_values(table, value)
    if stmt is None:
        print("沒有資料插入")
        return False
    
    with engine.begin() as conn:
        result = conn.execute(stmt)
        print(f"實際寫入：{result.rowcount}")
    return True

def update_from_json(file_path:Path):
    print(f"處理檔案{file_path}")
    update_status = False
    try:
        for table_name in list(tables.keys()):
            if table_name in str(file_path):
                # print(f"更新資料表{table_name}")
                df_columns = [col.name for col in tables[table_name].columns]
                # print(df_columns)
                df = data_NF(file_path)
                df = df[df_columns]

                update_status = upsert_data(tables[table_name], df.to_dict(orient='records'))

    except IntegrityError as e:
        error_code = e.orig.args[0]
        if error_code == 1452:
            print("=====測站不存在，更新資料=====")
            # 更新站點必須是 basic 表，目前以b排序為最前
            update_stations(file_path)
            update_status = upsert_data(tables[table_name], df.to_dict(orient='records'))
    except Exception as e:
        print("⚠️ 發生錯誤：", e.__class__.__name__, e)
    
    # 如果處理完，加上前綴"Z_"避免重複讀取，並回傳成功
    if update_status:
        new_name = f"Z_{file_path.name}"
        file_path.rename(file_path.with_name(new_name))
        return 1

    return 0




if __name__ == "__main__":
    pass
    update_data()

