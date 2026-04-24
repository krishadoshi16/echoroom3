#!/usr/bin/env bash
# exit on error
set -o errexit

# Navigate to the backend directory relative to the repo root
cd EchoRoom_Postgres/backend

pip install -r requirements.txt

python manage.py collectstatic --no-input
python manage.py migrate
