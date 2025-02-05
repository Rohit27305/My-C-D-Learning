#!/bin/bash

# Exit on any error
set -e

echo "Starting Docker installation..."

# Update package database
echo "Updating package database..."
sudo apt-get update -y

# Install required dependencies
echo "Installing required dependencies..."
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add Docker's official GPG key
echo "Adding Docker's official GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add Docker's repository
echo "Adding Docker's repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update package database again
echo "Updating package database with Docker packages..."
sudo apt-get update -y

# Install Docker Engine
echo "Installing Docker Engine..."
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Enable Docker service
echo "Enabling Docker service..."
sudo systemctl enable docker

# Start Docker service
echo "Starting Docker service..."
sudo systemctl start docker

# Verify Docker installation
echo "Verifying Docker installation..."
docker --version

echo "Docker has been installed successfully!"
