#!/bin/bash

set -e

# navigate to project root directory
pushd "$APP_HOME" > /dev/null

# Start server
python \
    -Xfrozen_modules=off \
    manage.py runserver ${HOST}:${PORT}