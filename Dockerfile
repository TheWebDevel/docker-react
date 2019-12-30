# Builder Phase

# Base Image
FROM node:alpine as builder
# Set Workdir
WORKDIR ./app
# Copy package.json
COPY ./package.json .
# Install Dependencies
RUN npm install
# Copy other files to container
COPY . .
# Build Application
RUN npm run build


# Run Phase

#Base Image
FROM nginx:alpine
# Expose Port 80
EXPOSE 80
# Copy build folder from builder phase
COPY --from=builder /app/build /usr/share/nginx/html