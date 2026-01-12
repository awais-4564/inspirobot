# Stage 1: Build the Flutter app
FROM ubuntu:22.04 AS build

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    unzip \
    xz-utils \
    zip \
    libglu1-mesa \
    openjdk-11-jdk \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Set up Flutter
ARG FLUTTER_VERSION=3.24.0
RUN git clone https://github.com/flutter/flutter.git /flutter
WORKDIR /flutter
RUN git checkout ${FLUTTER_VERSION}

ENV PATH="/flutter/bin:${PATH}"

# Enable Flutter web
RUN flutter config --enable-web
RUN flutter doctor -v

# Set working directory
WORKDIR /app

# Copy pubspec files and download dependencies
COPY pubspec.* ./
RUN flutter pub get

# Copy the rest of the application
COPY .  .

# Build the web application
RUN flutter build web --release

# Stage 2: Serve the app with Nginx
FROM nginx:alpine

# Copy the built web app from the build stage
COPY --from=build /app/build/web /usr/share/nginx/html

# Copy nginx configuration (optional - uncomment if you create custom nginx. conf)
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]