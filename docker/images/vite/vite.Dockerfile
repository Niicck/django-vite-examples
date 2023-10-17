FROM node:19-bullseye-slim

ARG EXAMPLE_APP_PATH

# Set working directory
ARG APP_HOME=/app
WORKDIR ${APP_HOME}

# Install node modules
COPY "${EXAMPLE_APP_PATH}/package.json" /app
COPY "${EXAMPLE_APP_PATH}/package-lock.json" /app
RUN npm install && npm cache clean --force

# Copy application code to WORKDIR
COPY \
    "${EXAMPLE_APP_PATH}/vite.config.js" \
    "${EXAMPLE_APP_PATH}/tailwind.config.js" \
    "${EXAMPLE_APP_PATH}/tsconfig.json*" \
    ./
COPY "${EXAMPLE_APP_PATH}/demo" ./demo

COPY ./docker/images/vite/scripts ./docker/images/vite/scripts

CMD ./docker/images/vite/scripts/start.sh
