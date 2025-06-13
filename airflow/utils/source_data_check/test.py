from tasks.update_data import update_stations, update_from_json
from pathlib import Path

file_path = Path("data/geothermal_li/2025-06-09_14.json")

# update_stations(file_path)
update_from_json(file_path)