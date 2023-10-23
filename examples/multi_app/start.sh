#!/bin/bash
set -e -a

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")

# Source project's environment variables
source "$SCRIPT_DIR/.env"

echo "------ Start django, the default vite dev server, vite_app_1 dev server"
docker compose \
  -f "$SCRIPT_DIR/docker-compose.yml" \
  up \
  django vite_default vite_app_1 \
  $@
