# Stage 1: Build the React application
FROM node:20-alpine as build-stage

WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) first to leverage Docker cache
COPY package.json ./
COPY package-lock.json ./
# If you use yarn, use COPY yarn.lock .

RUN npm install
# If you use yarn, use RUN yarn install --frozen-lockfile

COPY . .

RUN npm run build
# If you use yarn, use RUN yarn build

# Stage 2: Serve the application with Nginx
FROM nginx:alpine as production-stage

# Remove default Nginx configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copy our custom Nginx configuration
COPY nginx.conf /etc/nginx/conf.d/incasesofemergency.conf

# Copy the built React app from the build-stage
COPY --from=build-stage /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
