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
sudo useradd -u 50000 -g docker -m airflow


gcloud compute scp docker-compose.yaml Tibame@airflow-server:/home/Tibame/ --zone "asia-east1-c" --project "solar-457715"
gcloud compute scp docker-compose.yaml Dockerfile .env Tibame@airflow-server-test:/home/Tibame/Solar_Project/ --zone "us-central1-f" --project "solar-457715"
gcloud compute scp --recurse ./airflow/tasks/a_hour.py Tibame@airflow-server:/home/Tibame/airflow/tasks --zone "asia-east1-c" --project "solar-457715"

sudo chmod 777 /home/Tibame/airflow/tasks
