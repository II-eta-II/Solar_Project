from pathlib import Path
import json

def saveJson(file_path, data):
    with open(file_path, "w", encoding="utf-8") as file:
        json.dump(data, file, ensure_ascii=False, indent=2)

def saveJsonWithTimestamp(file_dir, file_name, data):
    pass