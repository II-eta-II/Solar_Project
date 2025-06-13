from utils.mysql_lib import update_with_filter, upsert_with_values, insert_with_values
from utils.mysql_lib import stations_table, MYSQL_CONN
from utils.my_lib import loadJson, saveJson
from pathlib import Path
import pandas as pd
import numpy as np
from shapely.geometry import Point
# from geoalchemy2.shape import from_shape
from utils.agr_cwa_crawler import AgrCwaCrawler

def updateData():
    data = loadJson(Path("data/others/point_list.json"))
    data = data["station"]
    df = pd.DataFrame(data)
    # 清洗資料
    # 讓欄位名稱一致
    df.rename(columns={"ID": "key_ID", "Level": "level"}, inplace=True)
    # 讓沒有時間的為空值
    df["StnEndTime"] = df["StnEndTime"].replace("", None)

    data = df.to_dict(orient='records')
    stmt = upsert_with_values(stations_table, data)
    trans = MYSQL_CONN.begin()
    result = MYSQL_CONN.execute(stmt)
    trans.commit()

def getPointList():
    crawler = AgrCwaCrawler()
    data = crawler.getPointList()
    saveJson("data/others/point_list.json", data)

if __name__ == "__main__":
    pass
    getPointList()
    # updateData()