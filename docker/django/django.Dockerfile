FROM python:3.11-slim-bullseye

# Install apt packages
RUN apt-get update && apt-get install --no-install-recommends -y \
    # For building Python packages
    build-essential \
    # psycopg2 dependencies
    libpq-dev \
    # For installing django-vite from github repo
    git

# Set working directory
WORKDIR /app

# Python ENV vars
ENV \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100

# Install python requirements
COPY ./requirements.txt ./requirements.txt
RUN pip install -r ./requirements.txt

# Copy manage.py
COPY ./manage.py ./manage.py

CMD python \
    -Xfrozen_modules=off \
    manage.py runserver ${HOST}:${PORT}

# Note: Application code will be mounted via volumes