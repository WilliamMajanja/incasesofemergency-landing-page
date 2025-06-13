# Stage 1: Build the React application
FROM node:20-alpine AS build-stage

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) first.
# This allows Docker to cache the npm install step.
# If only your source code changes, this layer won't be rebuilt.
COPY package*.json ./

# Install dependencies, including react-scripts
RUN npm install
# If you are using yarn, use: RUN yarn install

# Copy the rest of your application code
COPY . .

# Build the React application for production
# This generates static files in the 'build' directory (by default)
RUN npm run build
# If you are using yarn, use: RUN yarn run build

# Stage 2: Serve the built application with Nginx
FROM nginx:alpine AS production-stage

# Remove the default Nginx configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy your custom Nginx configuration
# Ensure 'nginx.conf' is in the same directory as your Dockerfile,
# or specify the correct relative path if it's in a subdirectory.
COPY nginx.conf /etc/nginx/conf.d/incasesofemergency.conf

# Copy the built React app from the 'build-stage'
# The /app/build path comes from the WORKDIR /app and RUN npm run build in the first stage.
COPY --from=build-stage /app/build /usr/share/nginx/html

# Expose port 80 (Nginx's default)
EXPOSE 80

# Command to run Nginx when the container starts
# The Nginx base image often has a default CMD, but it's good practice to be explicit.
CMD ["nginx", "-g", "daemon off;"]
