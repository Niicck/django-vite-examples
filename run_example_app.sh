#!/bin/bash
set -e -a

# Set build args for docker-compose
EXAMPLE_APP=$1

# Check that an example_app was provided
if [ -z "$EXAMPLE_APP" ]; then
  echo "Please provide the name of an example app"
  echo "Example:"
  echo "sh run_example_app.sh legacy-settings"
  exit 1
fi

# get addtional docker-compose args, if any were passed
shift
OPTIONAL_DOCKER_COMPOSE_ARGS="$@"

# Set build arg for docker-compose
EXAMPLE_APP_PATH="./examples/${EXAMPLE_APP}"

# Set project name for docker containers
COMPOSE_PROJECT_NAME="django-vite-${EXAMPLE_APP}"

# Source project's environment variables
source "${EXAMPLE_APP_PATH}/.env"

# Run the docker compose command
docker compose \
  -f "./docker/docker-compose.yml" \
  up \
  $OPTIONAL_DOCKER_COMPOSE_ARGS
