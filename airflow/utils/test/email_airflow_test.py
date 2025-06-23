from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime, timedelta
from airflow.configuration import conf

# 這裡不需在 DAG 裡寫 SMTP 帳密，透過 airflow.cfg 的 email_conn_id 指定 Connection

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2023, 1, 1),
    'email': ['recipient@example.com'],  # 收信人清單
    'email_on_failure': True,            # 任務失敗時寄信
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

with DAG(
    dag_id='example_email_on_failure_with_conn',
    default_args=default_args,
    schedule_interval='@daily',
    catchup=False,
) as dag:

    # 故意失敗的任務，觸發寄信
    fail_task = BashOperator(
        task_id='fail_task',
        bash_command='exit 1',
    )
