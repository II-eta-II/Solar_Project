from utils.agr_cwa_crawler import AgrCwaCrawler
from utils.my_lib import loadJson, saveJson
from pathlib import Path
from datetime import datetime

file_path = Path("data/others/test.json")
crawler = AgrCwaCrawler()
time = datetime.strptime("2025-05-23 9:00:00", "%Y-%m-%d %H:%M:%S")
data = crawler.getStationData(time, "basic_li")
# data = crawler.getPointList()
saveJson(file_path, data)

