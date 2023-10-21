#!/bin/bash
set -e -a

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")

# Source project's environment variables
source "$SCRIPT_DIR/.env"

# Start docker services
docker compose \
  -f "$SCRIPT_DIR/docker-compose.yml" \
  up \
  $@
