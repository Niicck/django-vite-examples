#!/bin/bash
set -e -a

# Set action for docker-compose
ACTION=$1

# Check that an action was provided
if [ -z "$ACTION" ]; then
  echo "Please provide an action for docker-compose"
  echo "Example:"
  echo "sh run_example_app.sh up legacy-settings"
  exit 1
fi

# Set the example_app you want to run
EXAMPLE_APP=$2

# Check that an example_app was provided
if [ -z "$EXAMPLE_APP" ]; then
  echo "Please provide the name of an example app"
  echo "Example:"
  echo "sh run_example_app.sh up legacy-settings"
  exit 1
fi

# get addtional docker-compose args, if any were passed
shift 2
OPTIONAL_DOCKER_COMPOSE_ARGS="$@"

# Set build arg for docker-compose
PROJECT_ROOT_PATH="./examples/${EXAMPLE_APP}"

# Set project name for docker containers
COMPOSE_PROJECT_NAME="django-vite-${EXAMPLE_APP}"

# Source project's environment variables
source "${PROJECT_ROOT_PATH}/.env"

# TODO:: I change the docker-compose.yml path to PROJECT_ROOT_PATH

# Run the docker compose command
docker compose \
  -f "$PROJECT_ROOT_PATH/docker-compose.yml" \
  $ACTION \
  $OPTIONAL_DOCKER_COMPOSE_ARGS
