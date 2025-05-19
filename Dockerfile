FROM apache/airflow:2.8.1

# 切換 root 建立目錄並設定權限
USER root
RUN mkdir -p /opt/airflow/logs/scheduler && \
    chown -R airflow: /opt/airflow/logs && \
    chmod -R 755 /opt/airflow/logs

# 切回 airflow 使用者
USER airflow
