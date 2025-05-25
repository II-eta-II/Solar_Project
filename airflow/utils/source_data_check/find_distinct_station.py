from pathlib import Path
import json
from utils.my_lib import loadJson

file_path = Path("data/basic_li/2025-05-16_03.json")
data = loadJson(file_path)
data = data[0]["Records"]
basic = []
for item in data:
    station = item["key_ID"]
    basic.append(station)
print(f"basic {len(basic)}")

file_path = Path("data/rain_li/2025-05-16_03.json")
data = loadJson(file_path)
data = data[0]["Records"]
rain = []
for item in data:
    station = item["ID"]
    rain.append(station)
print(f"rain {len(rain)}")

file_path = Path("data/soil_li/2025-05-16_03.json")
data = loadJson(file_path)
data = data[0]["Records"]
soil = []
for item in data:
    station = item["key_ID"]
    soil.append(station)
print(f"soil {len(soil)}")

file_path = Path("data/geothermal_li/2025-05-16_03.json")
data = loadJson(file_path)
data = data[0]["Records"]
geothermal = []
for item in data:
    station = item["key_ID"]
    geothermal.append(station)
print(f"geothermal {len(geothermal)}")

stations = basic + rain + soil + geothermal
stations = list(set(stations))
print(f"{len(stations)}")