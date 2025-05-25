from utils.mysql_lib import update_with_filter, upsert_with_values, insert_with_values
from utils.mysql_lib import station_table, MYSQL_CONN
from utils.my_lib import loadJson
from pathlib import Path
import pandas as pd
from shapely.geometry import Point
from geoalchemy2.shape import from_shape

# 轉換經緯度地理資訊
def point_to_wkb(row):
    return from_shape(Point(row['Latitude'], row['Longitude']), srid=4326)

def updateData():
    file_path = Path("data/basic_li/2025-05-16_02.json")
    data = loadJson(file_path)
    data = data[0]["Records"]
    df = pd.DataFrame(data)

    # 去除風力級數
    df["wind_speed_mean"] = df["wind_speed_mean"].str.extract(r"([0-9.]+)").astype(float)

    # 把經緯度合為point屬性
    df['Location'] = df.apply(point_to_wkb, axis=1)

    # 取得映射table的欄位名稱
    column_names = [col.name for col in station_table.columns]
    # 取得資料的欄位名稱
    df_columns = df.columns

    # 交集
    intersection = list(set(column_names) & set(df_columns))

    # 只要資料表有的欄位
    df = df[intersection]

    stmt = upsert_with_values(station_table, df.to_dict(orient="records"))
    trans = MYSQL_CONN.begin()
    result = MYSQL_CONN.execute(stmt)
    trans.commit()

    print(f"{result.rowcount}")

def update_station_infomation():
    # 讀取資料來源
    file_path = Path("data/basic_li/2025-05-16_02.json")
    data = loadJson(file_path)
    data = data[0]["Records"]
    df = pd.DataFrame(data)

    # 去除風力級數
    df["wind_speed_mean"] = df["wind_speed_mean"].str.extract(r"([0-9.]+)").astype(float)

    # 把經緯度合為point屬性
    df['Location'] = df.apply(point_to_wkb, axis=1)

    # 取得映射table的欄位名稱
    column_names = [col.name for col in station_table.columns]
    # 取得資料的欄位名稱
    df_columns = df.columns

    # 交集
    intersection = list(set(column_names) & set(df_columns))

    # 只要資料表有的欄位
    df = df[intersection]

    stmt = upsert_with_values(station_table, df.to_dict(orient="records"))
    trans = MYSQL_CONN.begin()
    result = MYSQL_CONN.execute(stmt)
    trans.commit()

    print(f"{result.rowcount}")

aria = {
    "北": ["新北市", "臺北市", "基隆市", "桃園市", "新竹縣", "新竹市", "宜蘭縣"],
    "中": ["南投縣", "苗栗縣", "臺中市", "彰化縣", "雲林縣"],
    "南": ["嘉義市", "嘉義縣", "臺南市", "高雄市", "屏東縣", "澎湖縣"],
    "東": ["花蓮縣", "臺東縣"],
    "離": ["澎湖縣", "金門縣", "連江縣"],
}
updateData()