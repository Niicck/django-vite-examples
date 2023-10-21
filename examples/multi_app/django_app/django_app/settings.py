from pathlib import Path
from decouple import config


BASE_DIR = Path(__file__).resolve().parent
PROJECT_DIR = BASE_DIR.parent

USE_TZ = True

SECRET_KEY = config("SECRET_KEY")

DEBUG = config("DEBUG", default=True, cast=bool) 

ROOT_URLCONF = "django_app.urls"

TEMPLATES = [
    {
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        "DIRS": [],
        "APP_DIRS": True,
        "OPTIONS": {
            "context_processors": [],
            "debug": DEBUG,
        },
    },
]

ALLOWED_HOSTS = ["localhost", "0.0.0.0", "127.0.0.1"]

STATIC_URL = "/static/"
STATIC_ROOT = BASE_DIR / "staticfiles"

INSTALLED_APPS = [
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    "django_vite",
    "django_app",
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

# DJANGO_VITE settings
DJANGO_VITE = {
    "default": {
        "dev_mode": True,
        "static_url_prefix": config("DEFAULT_STATIC_URL_PREFIX"),
        "dev_server_port": config("DEFAULT_DEV_SERVER_PORT"),
    },
    "vite_app_1": {
        "dev_mode": False,
        "static_url_prefix": config("APP1_STATIC_URL_PREFIX"),
        "dev_server_port": config("APP1_DEV_SERVER_PORT"),
    },
    "vite_app_2": {
        "dev_mode": False,
        "static_url_prefix": config("APP2_STATIC_URL_PREFIX"),
        "dev_server_port": config("APP2_DEV_SERVER_PORT"),
    },
    "vite_app_3": {
        "dev_mode": True,
        "static_url_prefix": config("APP3_STATIC_URL_PREFIX"),
        "dev_server_port": config("APP3_DEV_SERVER_PORT"),
    },
}

# Add the build.outDir from vite.config.js to STATICFILES_DIRS
# so that collectstatic can collect your compiled vite assets.
STATICFILES_DIRS = [
    PROJECT_DIR.parent / "vite_app_1" / "dist",
    PROJECT_DIR.parent / "vite_app_2" / "dist",
]
