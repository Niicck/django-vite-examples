from pathlib import Path
from decouple import config


BASE_DIR = Path(__file__).resolve().parent
PROJECT_DIR = BASE_DIR.parent

USE_TZ = True

SECRET_KEY = config("SECRET_KEY")

DEBUG = config("DEBUG", default=False, cast=bool) 

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

# legacy django-vite settings
DJANGO_VITE = {
    "default": {
        "dev_mode": config("DJANGO_VITE_DEV_MODE", default=False, cast=bool),
        "dev_server_port": config("DJANGO_VITE_DEV_SERVER_PORT", default="5173"),
        "dev_server_host": config("DJANGO_VITE_DEV_SERVER_HOST", default="localhost"),
    }
}

# Add the build.outDir from vite.config.js to STATICFILES_DIRS
# so that collectstatic can collect your compiled vite assets.
STATICFILES_DIRS = [
    BASE_DIR / "vite_assets_dist"
]
