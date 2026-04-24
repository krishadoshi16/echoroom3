#!/usr/bin/env bash
# exit on error
set -o errexit

# No need to cd if rootDir is set in render.yaml
pip install -r requirements.txt

python manage.py collectstatic --no-input
python manage.py migrate
