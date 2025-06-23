from tasks.error_test import error_log
from datetime import datetime, timedelta
from airflow.decorators import dag, task

default_args = {
    "owner": "admin",
    "depends_on_past": False,
    "email": ["etashieh@silika-ace.com"],
    "email_on_failure": True,
    "email_on_retry": False,
}

@dag(
    "t_01_raise_error",
    default_args=default_args,
    description="raise some error for test",
    schedule=None,
    start_date=datetime(2025, 6, 17),
    catchup=False,
)
def task1():
    error_log()

dag = task1()