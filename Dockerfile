# Base image for Puppeteer
FROM ghcr.io/puppeteer/puppeteer:19.7.2

# Set environment variables for Puppeteer
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome-stable

# Install Bun
RUN curl -fsSL https://bun.sh/install | bash

# Add Bun to the PATH
ENV PATH="/root/.bun/bin:$PATH"

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package files
COPY package.json bun.lockb ./

# Install dependencies using Bun
RUN bun install

# Copy the rest of the application files
COPY . .

# Set the default command to run the Bun app
CMD [ "bun", "run", "index.ts" ]
