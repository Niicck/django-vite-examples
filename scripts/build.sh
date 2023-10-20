#!/bin/bash
set -e

SCRIPT_DIR=$(dirname "${BASH_SOURCE[0]}")

docker build \
    -t django-vite:django-app \
    -f $SCRIPT_DIR/../docker/django/django.Dockerfile \
    $SCRIPT_DIR/../docker/django

docker build \
    -t django-vite:vite-app \
    -f $SCRIPT_DIR/../docker/vite/vite.Dockerfile \
    $SCRIPT_DIR/../docker/vite
