from airflow.decorators import task

@task
def error_log():
    print("device by zero")
    x = 1/0