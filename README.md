# django-vite examples
Examples of how to use the new multi-app version of django-vite.

## Install

All of the example demos are on docker. Build the images with:

```bash
make build
```

## Examples

### [Legacy Settings](examples/legacy_settings/README.md)

```bash
make legacy-settings-demo
```

This demo runs django-vite using our legacy `DJANGO_VITE_*` settings. This is just to prove that backwards compatibility still works.

See: [settings.py](./examples/legacy_settings/django_app/settings.py)

### [New Settings](examples/new_settings/README.md)

```bash
make new-settings-demo
```

This demo shows how to run a single django-vite app using the new `DJANGO_VITE={...}` settings. Everything else in the setup is identical to the legacy-settings demo.

See: [settings.py](./examples/new_settings/django_app/settings.py)

### [Multi-App](examples/multi_app/README.md)

```bash
make multi-app-demo
```

This demo shows how to use django-vite to load assets from 4 different vite apps.

- The **default** app is running on a vite dev server with `dev_mode=True`.
- **vite_app_1** app is also running on a vite dev server with `dev_mode=True`.
- **vite_app_2** app has already been compiled in a production build. Those assets are being served from the `STATIC_ROOT` with `dev_mode=False`.
- **vite_app_3** app has also been compiled in a production build. Those assets are being served from the `STATIC_ROOT` with `dev_mode=False`.

Noteworthy differences between the multi-app setup and the other demos:
- [settings.py](./examples/multi_app/django_app/django_app/settings.py) has the `DJANGO_VITE` settings that enable multiple apps.
- [index.html](./examples/multi_app/django_app/django_app/templates/index.html) shows how to load assets from multiple vite apps.
- [vite_app_1/vite.config.js](./examples/multi_app/vite_app_1/vite.config.js) shows how I'm using `static_url_prefix` for directing build output and dev server routing.

\*\*There's 1 bug I've found with this demo: I'm not able to make HMR work on 2 different vite dev servers at the same time -- only one vite app gets changes registered to it in real time. I'll keep investigating.