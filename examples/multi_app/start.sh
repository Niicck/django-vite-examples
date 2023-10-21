#!/bin/bash
set -e -a

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")

# Source project's environment variables
source "$SCRIPT_DIR/.env"

echo "------ Build vite assets for vite_app_1"
docker compose \
  -f "$SCRIPT_DIR/docker-compose.yml" \
  run --rm vite_app_1 \
  npm run build

echo "------ Build vite assets for vite_app_2"
docker compose \
  -f "$SCRIPT_DIR/docker-compose.yml" \
  run --rm vite_app_2 \
  npm run build

echo "------ Collect static assets"
docker compose \
  -f "$SCRIPT_DIR/docker-compose.yml" \
  run --rm django \
  python manage.py collectstatic -c --noinput

echo "------ Start docker services"
docker compose \
  -f "$SCRIPT_DIR/docker-compose.yml" \
  up \
  django vite_default vite_app_3 \
  $@
