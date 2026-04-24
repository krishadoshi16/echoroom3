#!/usr/bin/env bash
# exit on error
set -o errexit

# Navigate to backend
pip install -r requirements.txt

python manage.py collectstatic --no-input
python manage.py migrate

# Seed data if it's the first time
# Using loaddata to restore your previous work
python manage.py loaddata db_seed.json || echo "Data already seeded or error"
