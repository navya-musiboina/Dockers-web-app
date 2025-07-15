# Use official Ubuntu image
FROM ubuntu:20.04

# Disable interaction during install
ENV DEBIAN_FRONTEND=noninteractive

# Install Python 3 (for simple HTTP server)
RUN apt-get update && \
    apt-get install -y python3 && \
    apt-get clean

# Set working directory inside container
WORKDIR /app

# Copy all local files into the container
COPY . /app

# Expose port 8000 to access from host
EXPOSE 8000

# Run Python's built-in HTTP server
CMD ["python3", "-m", "http.server", "8000"]
