FROM node:19-bullseye-slim as base

# Set working directory
WORKDIR /app

# Install node modules
COPY \
    "./package.json" \
    "./package-lock.json" \
    ./
RUN npm install && npm cache clean --force

# Copy tailwind.config.js code to WORKDIR
COPY "./tailwind.config.js" .

CMD npm run dev

# Note: vite.config.js and src code will be mounted via volumes
