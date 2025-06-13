from pathlib import Path
import json

# 回傳值的最大長度
def get_value_lengths(input_dict:dict):
    return {key: len(value) for key, value in input_dict.items()}

# 回傳兩個字典的最大值
def max_values_with_fallback(dict1: dict, dict2: dict, default: int = 0) -> dict:
    all_keys = dict1.keys() | dict2.keys()
    return {
        key: max(dict1.get(key, default), dict2.get(key, default))
        for key in all_keys
    }

def collect_max_len_values(dict_list)->dict:
    result = {}
    for d in dict_list:
        for key, value in d.items():
            if key not in result or len(value) > len(result[key]):
                result[key] = value
    return result



file_path = Path("data/soil_li/2025-06-09_09.json")
with open(file_path, "r", encoding="utf-8") as file:
    data = json.load(file)

station_list = data[0]["Records"]
result = collect_max_len_values(station_list)

for key, value in result.items():
    print(len(value), key, value, sep="\t")

