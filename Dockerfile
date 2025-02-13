# Use an Nginx base image for a static website
FROM nginx:alpine

# Copy application files to the Nginx server directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 for web access
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
 