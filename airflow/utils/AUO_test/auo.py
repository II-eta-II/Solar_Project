import requests

url = "https://gms.auo.com/MvcWebPortal/api/GetDeviceTreeData?plant_no=mTDIaRYlLIx%2BiD7UQ3KiHSTiO5UF7a1k&timeType=UTC&timeZoneOffSet=8&SW_Version_User=ADVANCED&lang=zh-TW&PlantType=BENQDL"

cookies = {"Token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJBY3QiOiJMTEhUV05ATVMyMy5ISU5FVC5ORVQyMDI1LzA2LzE3In0.jPIogKboYT2u2BFQnQek2RrVhJatAazOv7oUTb3vaes"}
headers= {
    "accept": "application/json, text/javascript, */*; q=0.01",
    "accept-encoding": "gzip, deflate, br, zstd",
    "accept-language": "zh-TW,zh;q=0.9,en-US;q=0.8,en;q=0.7,ja;q=0.6",
    "priority": "u=0, i",
    "referer": "https://gms.auo.com/MvcWebPortal/Overview/index?plantno=mTDIaRYlLIx%2BiD7UQ3KiHSTiO5UF7a1k&historical=true",
    "x-requested-with": "XMLHttpRequest",
    "user-agent": "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Mobile Safari/537.36",
}

result = requests.get(url, headers=headers, cookies=cookies)

print(result.status_code)
if result.status_code == 200:
    print(result.text)