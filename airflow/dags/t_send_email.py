from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.utils.dates import days_ago
from airflow.utils.email import send_email

def notify_email():
    to = ["etashieh@silika-ace.com"]
    subject = "Airflow Email Notification from DAG"
    html_content = """
    <h3>Hello!</h3>
    <p>This is a test email sent by Airflow using SMTP Connection.</p>
    """
    send_email(to=to, subject=subject, html_content=html_content)

with DAG(
    dag_id="t_email_via_connection_example",
    start_date=days_ago(1),
    schedule_interval=None,
    catchup=False,
) as dag:

    email_task = PythonOperator(
        task_id="send_test_email",
        python_callable=notify_email,
    )
