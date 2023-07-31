#!/bin/bash

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Check if Docker is installed
if ! command_exists docker; then
  echo "Docker not found. Installing Docker..."
  # Install Docker (Ubuntu/Debian)
  sudo apt-get update
  sudo apt-get install -y docker.io
  # Start and enable Docker service
  sudo systemctl start docker
  sudo systemctl enable docker
fi

# Check if Docker Compose is installed
if ! command_exists docker-compose; then
  echo "Docker Compose not found. Installing Docker Compose..."
  # Install Docker Compose
  sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
fi

# Pull required Docker images
echo "Pulling Docker images for MongoDB and Mongo Express..."
docker pull mongo:latest
docker pull mongo-express:latest

# Create Docker network
if ! docker network ls | grep -q "mongo-network"; then
  echo "Creating Docker network: mongo-network"
  docker network create mongo-network
fi

echo "Setup completed successfully."
