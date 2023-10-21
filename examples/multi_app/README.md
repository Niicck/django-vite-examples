# django-vite :: multi-app

This demo shows how to use django-vite to load assets from 4 different vite apps.

- The **default** app is running on a vite dev server with `dev_mode=True`.
- **vite_app_1** app is also running on a vite dev server with `dev_mode=True`.
- **vite_app_2** app has already been compiled in a production build. Those assets are being served from the `STATIC_ROOT` with `dev_mode=False`.
- **vite_app_3** app has also been compiled in a production build. Those assets are being served from the `STATIC_ROOT` with `dev_mode=False`.

Noteworthy differences between the multi-app setup and the other demos:
- [settings.py](./django_app/django_app/settings.py) has the `DJANGO_VITE` settings that enable multiple apps.
- [index.html](./django_app/django_app/templates/index.html) shows how to load assets from multiple vite apps.
- [vite_app_1/vite.config.js](./vite_app_1/vite.config.js) shows how I'm using `static_url_prefix` for directing build output and dev server routing.

\*\*There's 1 bug I've found with this demo: I'm not able to make HMR work on 2 different vite dev servers at the same time -- only one vite app gets changes registered to it in real time. I'll keep investigating.
