# Use a base image with Bash and necessary utilities
FROM debian:latest

# Install required packages
RUN apt-get update && apt-get install -y \
    cowsay \
    fortune \
    netcat \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy application script
COPY script.sh /app/script.sh

# Make the script executable
RUN chmod +x /app/script.sh

# Expose the application port
EXPOSE 4499

# Start the application
CMD ["/app/script.sh"]
