from datetime import datetime, timedelta
from utils.agr_cwa_crawler import AgrCwaCrawler
from utils.my_lib import saveJson
from airflow.decorators import task
import time
from pathlib import Path
import json

@task
def getOneHourData():
    # print("start")
    crawler = AgrCwaCrawler()
    # 取得最近的整點時刻
    on_the_hour = datetime.now().replace(minute=0, second=0, microsecond=0)
    start_time = on_the_hour - timedelta(hours=1)
    li_types = crawler._li_types
    for li in li_types:
        dtime = start_time
        data = []
        while dtime < on_the_hour:
            time.sleep(2)
            record = crawler.getStationData(dtime, li)
            if not record:
                # print(f"{li} {dtime} get data Failed!!")
                continue
            print(f"{li} {dtime} get data sucsses")
            # print(type(record))
            record["DTIME"] = dtime.strftime("%Y-%m-%d %H:%M:%S")
            record["li_type"] = li
            data.append(record)
            
            dtime += timedelta(minutes=10)
        
        time_str = start_time.strftime("%Y-%m-%d_%H")
        file_path = Path("data", li, time_str + ".json")
        file_path.parent.mkdir(exist_ok=True, parents=True)
        # print(data)
        with open(file_path, "w", encoding="utf-8") as file:
            json.dump(data, file, ensure_ascii=False, indent=2)
            # print(file_path)
            # print("write success")
    return
