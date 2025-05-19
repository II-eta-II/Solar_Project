docker compose up --build -d

docker-compose run --rm scheduler_app airflow db init

gcloud compute scp --recurse ./* airflow-server:~/ --zone=asia-east1-c
gcloud compute scp --recurse ./* airflow-server:~/ --zone=asia-east1-c --project=solar-457715
curl localhost:8081