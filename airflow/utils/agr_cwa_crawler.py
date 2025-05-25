import requests
from datetime import datetime


class TestURLFailed(Exception):
    """這是自定義的錯誤類別"""
    pass


class AgrCwaCrawler():

    _li_types = ["basic_li", "rain_li", "geothermal_li", "soil_li"]

    def __init__(self):
        self.headers = {
            "content-type": "application/x-www-form-urlencoded; charset=UTF-8",
            "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36",
            "host": "agr.cwa.gov.tw",
            "origin": "https://agr.cwa.gov.tw",
            "referer": "https://agr.cwa.gov.tw/",
            "x-requested-with": "XMLHttpRequest",
        }
        self.session = requests.Session()
        self.session.headers.update(self.headers)
        if not self.isURLAvaliable():
            raise TestURLFailed

    def isURLAvaliable(self):
        url = "https://agr.cwa.gov.tw"
        response = self.session.get(url)
        if response.status_code == 200:
            print(f"連線成功！ +++{response.status_code}+++")
            return True
        print(f"連線失敗！ ---{response.status_code}---")
        return False

    def getPointList(self):
        url = "https://agr.cwa.gov.tw/monitor/get_point_list"
        point_data = {
            "area": "",
            "level": "",
            "city": "",
        }
        response = self.session.post(url, data=point_data)
        return response.json()

    def getStationData(self, obs_time: datetime, li_type: str):
        """
        method: post\n
        obs_time: yyyy-mm-dd hh:mm:ss (2025-04-25 08:20:00)\n
        li_type: basic_li, rain_li, geothermal_li, soil_li
        """
        # 雨量的請求網址不一樣
        if li_type == "rain_li":
            url = "https://agr.cwa.gov.tw/monitor/get_station_rain_data"
        else:
            url = "https://agr.cwa.gov.tw/monitor/get_station_data"

        # 地溫以及土壤濕度資料間隔 1小時
        if li_type in ("geothermal_li", "soil_li"):
            if obs_time.minute != 0:
                return None

        monitor_data = {
            "area": "",
            "level": "",
            "city": "",
            "obs_time": obs_time,
            "li_type": li_type,
        }

        response = self.session.post(url, data=monitor_data)

        if response.status_code != 200:
            return None

        return response.json()
