# django-vite examples
Example Django apps showcasing how to use django-vite v3.

## Install

All of the example demos run on Docker. Build the images with:

```bash
make build
```

## Examples

### 1. Legacy Settings

This demo demonstrates backwards compatibility with legacy `DJANGO_VITE_*` settings from django-vite v2 and earlier versions.

|![Legacy Settings](/img/legacy-settings.png)|
|-|

- **Documentation:** [README.md](examples/legacy_settings/README.md)
- **Run the Demo:**
  ```bash
  make legacy-settings-demo
  ```
- **Access the Demo:** http://localhost:8001/
- **Quick Glance:** [settings.py](./examples/legacy_settings/django_app/settings.py)


### 2. New Settings (v3)

This demo shows how to run a single django-vite app using the new `DJANGO_VITE={...}` settings from django-vite v3 and higher. Everything else in the setup is identical to the legacy-settings demo.

|![Legacy Settings](/img/new-settings.png)|
|-|

- **Documentation:** [README.md](examples/new_settings/README.md)
- **Run the Demo:**
  ```bash
  make new-settings-demo
  ```
- **Access the Demo:** http://localhost:8002/
- **Quick Glance:** [settings.py](./examples/new_settings/django_app/settings.py)

### 3. Multi-App

This demo shows django-vite loading assets from 4 different vite apps.

|![Multi-App](/img/multi-app.png)|
|-|

- **Documentation:** [README.md](examples/multi_app/README.md)
- **Run the Demo:**
  ```bash
  make build-multi-app-demo
  make multi-app-demo
  ```
- **Access the Demo:** http://localhost:8003/

This demo loads assets from 4 different vite apps:

- The **default** app is running on a vite dev server with `dev_mode=True`.
- **vite_app_1** app is also running on a vite dev server with `dev_mode=True`.
- **vite_app_2** app has already been compiled in a production build. Those assets are being served from the `STATIC_ROOT` with `dev_mode=False`.
- **vite_app_3** app has also been compiled in a production build. Those assets are being served from the `STATIC_ROOT` with `dev_mode=False`.

Noteworthy differences between the multi-app setup and the other demos:
- [settings.py](./examples/multi_app/django_app/django_app/settings.py) has the `DJANGO_VITE` settings that enable multiple apps.
- [index.html](./examples/multi_app/django_app/django_app/templates/index.html) shows how to load assets from multiple vite apps.
- [vite_app_1/vite.config.js](./examples/multi_app/vite_app_1/vite.config.js) shows how I'm using `static_url_prefix` for directing build output and dev server routing.

#### Bug Report

There's 1 bug I've found with this demo: I'm not able to make HMR work on 2 different vite dev servers if they're both trying to update assets on the same page. Only one vite app will get changes registered to it in real time.

Realistically, a developer is unlikely to be working on more than 1 vite app with dev_mode=True on the same page. But it may still be worth investigating.