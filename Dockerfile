# Use an official Node.js runtime as the base image
FROM node:18-alpine AS builder

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install Angular CLI globally
RUN npm install -g @angular/cli@15

# Install project dependencies
RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Build the Angular app for production
RUN ng build --configuration=production

# Expose port 4200 to the outside world
EXPOSE 4200

# Command to run the Angular application
CMD ["ng", "serve", "--host", "0.0.0.0"]
