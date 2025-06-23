import requests
import json
from airflow.models import Variable

# 你的 Channel Access Token（長期有效的權杖）
ACCESS_TOKEN = Variable.get("LINE_ACCESS_TOKEN")

# 目標好友的 User ID
USER_ID = 'Ue2b564e587ea9484fba36bc6250e2d8c'

# 要發送的訊息內容
message = 'Hello, 這是來自 Python 的訊息！'

headers = {
    'Authorization': f'Bearer {ACCESS_TOKEN}',
    'Content-Type': 'application/json'
}

body = {
    'to': USER_ID,
    'messages': [
        {
            'type': 'text',
            'text': message
        }
    ]
}

response = requests.post(
    'https://api.line.me/v2/bot/message/push',
    headers=headers,
    data=json.dumps(body).encode('utf-8')
)

print(f'Status code: {response.status_code}')
print(f'Response body: {response.text}')
