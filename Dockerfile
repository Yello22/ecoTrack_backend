FROM node:18-alpine3.19

# Set the working directory
WORKDIR /usr/src/app

# Install system dependencies
RUN apk add --no-cache openssl libc6-compat

# Copy package.json and package-lock.json
COPY package*.json ./

# Define build arguments and environment variables
ARG NODE_ENV
ENV NODE_ENV=${NODE_ENV}

# Install dependencies based on the NODE_ENV value
RUN if [ "$NODE_ENV" = "development" ]; then \
    npm install; \
    else \
    npm install --omit=dev --only=production; \
    fi

# Copy the rest of the application code
COPY . .

# Expose the application port
EXPOSE 3001

# Define the start script based on the NODE_ENV value
CMD ["sh", "-c", "if [ \"$NODE_ENV\" = \"development\" ]; then npm run start:dev; else npm run start:prod; fi"]
