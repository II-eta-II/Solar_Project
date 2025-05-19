FROM apache/airflow:2.9.0-python3.11

ENV TZ=Asia/Taipei


USER root
RUN apt-get update && \
        apt-get install git zsh vim curl wget zip make procps gcc python3-dev -y && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
    apt-get install -y \
    gcc \
    # build-essential \
    git \
    zsh \
    vim \
    # curl \
    # wget \
    # zip \
    # make \
    # procps \
    # python3-dev \
    && apt-get clean
USER airflow
# RUN pip install pymysql
    #   bash -c "airflow db upgrade &&
    #            airflow users create --username admin --password admin --firstname a --lastname b --role Admin --email admin@example.com &&
    #            airflow webserver"