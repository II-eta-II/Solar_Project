from sqlalchemy import create_engine, Table, MetaData, update, select
from sqlalchemy import and_
# from geoalchemy2 import Geometry
from sqlalchemy.dialects.mysql import dialect
import pandas as pd

from sqlalchemy.dialects.mysql import insert
from airflow.hooks.base import BaseHook

# 從 airflow server中取得資料庫連線環境變數
db_conn = BaseHook.get_connection("solar_mysql")
engine = create_engine(db_conn.get_uri())

# 2025/06/09 取消使用point
# # 宣告point屬性避免警告
# dialect.ischema_names['point'] = Geometry

# 建立資料表映射
metadata = MetaData()

# 映射table
stations_table = Table('stations', metadata, autoload_with=engine)
basic_table = Table('basic', metadata, autoload_with=engine)
rain_table = Table('rain', metadata, autoload_with=engine)
geothermal_table = Table('geothermal', metadata, autoload_with=engine)
soil_table = Table('soil', metadata, autoload_with=engine)
tables = {
    'stations': stations_table,
    'basic': basic_table,
    'rain': rain_table,
    'geothermal': geothermal_table,
    'soil': soil_table,
}
# MYSQL_CONN = engine.connect()

def select_all_from_table(table)->pd.DataFrame:
    """查詢映射表的所有資料並回傳df"""
    stmt = select(table)
    # result = MYSQL_CONN.execute(stmt)
    # df = pd.DataFrame(result.fetchall(), columns=result.keys())
    # return df
    with engine.begin() as conn:
        result = conn.execute(select(table))
        return pd.DataFrame(result.fetchall(), columns=result.keys())
    
def update_with_filter(table, filter, value):
    stmt = (
        update(table)
        .where(and_(*[
            table.c[col] == val for col, val in filter.items()
        ]))
        .values(**value)
    )
    return stmt


def insert_with_values(table, value):
    if not value:
        print("沒有插入資料")
        return None
    
    if isinstance(value, list):
        stmt = insert(table).values(value)  # 多筆
    elif isinstance(value, dict):
        stmt = insert(table).values(**value)  # 單筆
    else:
        raise ValueError("values 必須是 dict 或 list of dicts")
    return stmt

def upsert_with_values(table, value):
    if not value:
        print("沒有插入資料")
        return None

    # 設定 insert 語法
    stmt = insert_with_values(table, value)
    # 改寫 upsert 語法
    update_dict = {
        col.name: stmt.inserted[col.name]
        for col in table.columns
    }
    stmt = stmt.on_duplicate_key_update(**update_dict)
    return stmt