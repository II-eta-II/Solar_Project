from tasks.update_data import update_data
from datetime import datetime, timedelta
from airflow.decorators import dag, task

default_args = {
    "owner": "admin",
    "depends_on_past": False,
    "email": ["your_email@example.com"],
    "email_on_failure": False,
    "email_on_retry": False,
    "retries": 1,
    "retry_delay": timedelta(minutes=5)
}

@dag(
    "d_02_update_data",
    default_args=default_args,
    description="parse data and upload to database",
    schedule="45 * * * *",
    start_date=datetime(2025, 6, 12),
    catchup=False,
)
def task1():
    update_data()

dag = task1()