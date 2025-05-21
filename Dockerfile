FROM apache/airflow:2.10.5

ARG AIRFLOW_UID=50000
ARG AIRFLOW_GID=990
ARG AIRFLOW_USER=airflow
ARG AIRFLOW_GROUP=docker

USER root

# 建立 docker 群組（若不存在）
RUN groupadd -g ${AIRFLOW_GID} ${AIRFLOW_GROUP} || true

# 建立 airflow 使用者（若不存在）
RUN id ${AIRFLOW_USER} 2>/dev/null || \
    (getent passwd ${AIRFLOW_UID} >/dev/null && \
     usermod -l ${AIRFLOW_USER} $(getent passwd ${AIRFLOW_UID} | cut -d: -f1) || \
     useradd -u ${AIRFLOW_UID} -g ${AIRFLOW_GROUP} ${AIRFLOW_USER})

# 指定資料夾擁有者
RUN mkdir -p /sources/{data,logs,dags,tasks,utils,config} && \
    chown -R ${AIRFLOW_USER}:${AIRFLOW_GROUP} /sources

USER ${AIRFLOW_USER}
