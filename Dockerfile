# --- STAGE 1: Build/Test Stage ---
# Use a production-ready Node image for building dependencies
FROM node:20-slim AS builder

WORKDIR /app

# Copy package files first to leverage Docker layer caching
COPY package.json package-lock.json ./
RUN npm install --only=production
COPY . .

# In a real app, unit tests would run here.
# RUN npm test

# --- STAGE 2: Final Production Stage ---
# Use a minimal base image for security and size
FROM node:20-slim

# Set environment variable for the port
ENV PORT 8080
WORKDIR /app

# Copy only the necessary files from the builder stage
COPY --from=builder /app .

# Expose the application port
EXPOSE 8080

# Command to run the application
CMD [ "node", "server.js" ]
