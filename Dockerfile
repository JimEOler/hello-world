# Use official lightweight Nginx image
FROM nginx:alpine

# Remove default Nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy our HTML into the container
COPY index.html /usr/share/nginx/html/index.html

# Expose port 4433
EXPOSE 4433

# Nginx runs in the foreground by default in this image
CMD ["nginx", "-g", "daemon off;"]
