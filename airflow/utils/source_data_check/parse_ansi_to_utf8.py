import json
from pathlib import Path

file_path = Path(__file__).parent/"points"
with open(file_path, "r", encoding="utf-8") as file:
    data = json.load(file)
print(len(data["station"]))
file_path = Path(__file__).parent/"points.json"
with open(file_path, "w", encoding="utf-8") as file:
    json.dump(data, file, ensure_ascii=False, indent=2)
