docker compose up --build -d

docker-compose run --rm scheduler_app airflow db init

gcloud compute scp --recurse ./* airflow-server:~/ --zone=asia-east1-c
gcloud compute scp --recurse ./* airflow-server:~/ --zone=asia-east1-c --project=solar-457715
curl localhost:8081

docker run -it -d \
    --name airflow-server \
    -p 8080:8080 \
    -v $PWD/dags:/opt/airflow/dags \
    -v $PWD/logs:/opt/airflow/logs \
    -v $PWD/utils:/opt/airflow/utils \
    -v $PWD/tasks:/opt/airflow/tasks \
    -e PYTHONPATH=/opt/airflow \
    apache/airflow:2.8.1 airflow standalone

git fetch origin
git reset --hard origin/main
curl localhost:8081