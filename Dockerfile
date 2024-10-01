# Stage 1: Build the Vue.js application
FROM node:16-alpine as build-stage

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application source code
COPY . .

# Build the Vue.js application for production
RUN npm run build

# Stage 2: Serve the app with Nginx
FROM nginx:alpine

# Copy built Vue.js app from Stage 1 to the Nginx directory
COPY --from=build-stage /app/dist /usr/share/nginx/html

# Copy custom nginx configuration (if any, otherwise default works)
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 8081
EXPOSE 8081

# Update Nginx configuration to listen on port 8081
RUN sed -i 's/listen\s*80;/listen 8081;/g' /etc/nginx/conf.d/default.conf

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]