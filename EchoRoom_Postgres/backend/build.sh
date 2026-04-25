#!/usr/bin/env bash
# exit on error
set -o errexit

# Navigate to backend
pip install -r requirements.txt

python manage.py collectstatic --no-input
python manage.py migrate

# Seed data if it's the first time
python manage.py loaddata db_seed_utf8.json || echo "Data already seeded or error"

# Configure Google Auth
python setup_google_auth.py
