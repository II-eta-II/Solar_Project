from sqlalchemy import create_engine, Table, MetaData, update, select
from sqlalchemy import and_
from geoalchemy2 import Geometry
from sqlalchemy.dialects.mysql import dialect
import pandas as pd

from sqlalchemy.dialects.mysql import insert
from airflow.hooks.base import BaseHook

# 從 airflow server中取得資料庫連線環境變數
db_conn = BaseHook.get_connection("solar_mysql")
engine = create_engine(db_conn.get_uri())

# 宣告point屬性避免警告
dialect.ischema_names['point'] = Geometry

# 建立資料表映射
metadata = MetaData()

# 映射table
station_table = Table('station', metadata, autoload_with=engine)
MYSQL_CONN = engine.connect()

def select_all_from_table(table)->pd.DataFrame:
    stmt = select(table)
    result = MYSQL_CONN.execute(stmt)
    df = pd.DataFrame(result.fetchall(), columns=result.keys())
    return df

def update_with_filter(table, filter, values):
    stmt = (
        update(table)
        .where(and_(*[
            table.c[col] == val for col, val in filter.items()
        ]))
        .values(**values)
    )
    return stmt


def insert_with_values(table, values):
    if isinstance(values, list):
        stmt = insert(table).values(values)  # 多筆
    elif isinstance(values, dict):
        stmt = insert(table).values(**values)  # 單筆
    else:
        raise ValueError("values 必須是 dict 或 list of dicts")
    return stmt

def upsert_with_values(table, values):
    # 設定 insert 語法
    stmt = insert_with_values(table, values)
    # 改寫 upsert 語法
    update_dict = {
        col.name: stmt.inserted[col.name]
        for col in table.columns
    }
    stmt = stmt.on_duplicate_key_update(**update_dict)
    return stmt