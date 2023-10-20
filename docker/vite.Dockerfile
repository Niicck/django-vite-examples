FROM node:19-bullseye-slim as base

ARG DJANGO_APP_PATH
ARG VITE_APP_PATH

# Set working directory
WORKDIR /app

# Install node modules
COPY "${VITE_APP_PATH}/package.json" /app
COPY "${VITE_APP_PATH}/package-lock.json" /app
RUN npm install && npm cache clean --force

# Copy application code to WORKDIR
COPY \
    "${VITE_APP_PATH}/vite.config.js" \
    "${VITE_APP_PATH}/tailwind.config.js" \
    ./
COPY "${DJANGO_APP_PATH}/demo" ./demo

CMD npm run dev
