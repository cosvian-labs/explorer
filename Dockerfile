# Use Node.js 18 Alpine as base image
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package.json yarn.lock ./

# Install dependencies
RUN yarn install --frozen-lockfile --ignore-engines

# Copy source code
COPY . .

# Expose port 3400
EXPOSE 3400

# Start the application
CMD ["yarn", "dev", "--host", "0.0.0.0", "--port", "3400"]