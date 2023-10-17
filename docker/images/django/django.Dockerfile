FROM python:3.11-slim-bullseye

ARG EXAMPLE_APP_PATH

# Install apt packages
RUN apt-get update && apt-get install --no-install-recommends -y \
    # For building Python packages
    build-essential \
    # psycopg2 dependencies
    libpq-dev \
    # For troubleshooting
    curl

# Set working directory
ARG APP_HOME=/app
ENV APP_HOME ${APP_HOME}
WORKDIR ${APP_HOME}

# Python ENV vars
ENV \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100

# Install python requirements
COPY "${EXAMPLE_APP_PATH}/requirements.txt" ./requirements.txt
RUN pip install -r ./requirements.txt

# Copy application code to WORKDIR
COPY "${EXAMPLE_APP_PATH}/demo" ./demo
COPY "${EXAMPLE_APP_PATH}/manage.py" ./manage.py

COPY ./docker/images/django/scripts ./docker/images/django/scripts

CMD ./docker/images/django/scripts/start.sh
