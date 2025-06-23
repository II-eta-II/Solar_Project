FROM apache/airflow:2.10.5

ENV TZ=Asia/Taipei
USER root
RUN apt-get update && \
        # apt-get install git zsh vim curl wget zip make procps gcc python3-dev -y && \
    # ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
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