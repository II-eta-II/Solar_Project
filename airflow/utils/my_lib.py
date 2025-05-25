from pathlib import Path
import json

def saveJson(file_path, data):
    Path(file_path).parent.mkdir(exist_ok=True, parents=True)
    with open(file_path, "w", encoding="utf-8") as file:
        json.dump(data, file, ensure_ascii=False, indent=2)

def saveJsonWithTimestamp(file_dir, file_name, data):
    pass

def loadJson(file_path, mode="r"):
    with open(file_path, mode=mode, encoding="utf-8") as file:
        data = json.load(file)
    return data