from datetime import datetime, timedelta

from airflow import DAG
from airflow.decorators import dag, task
from airflow.operators.python import PythonOperator
from tasks.a_hour import getOneHourData


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
    "d_01_hour",
    default_args=default_args,
    description="get data every hour from agr_cwa",
    schedule="30 * * * *",
    start_date=datetime(2025, 5, 16),
    catchup=False,
)
def task1():
    getOneHourData()

# task1_obj = PythonOperator(
#     task_id = "task1",
#     python_callable=task1,
#     dag=dag,
# )

# task1_obj
task1()