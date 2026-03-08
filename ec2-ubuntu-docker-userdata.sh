#!/bin/bash

# Exit on error
set -e
# Print commands
set -x

echo "Starting EC2 Ubuntu Docker setup..."

# Update package list and install prerequisites
sudo apt update -y
#sudo apt install -y ca-certificates curl gnupg lsb-release

# Add Docker's official GPG key
#sudo install -m 0755 -d /etc/apt/keyrings
#sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
#sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker repository
#sudo tee /etc/apt/sources.list.d/docker.list <<EOF
#  deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable
#EOF

sudo apt update -y
#sudo apt install -y docker-ce docker-ce-cli containerd.io


echo "start the Caddy server"
sudo systemctl start caddy

# Start Docker service
sudo systemctl start docker
sudo systemctl enable docker

# Add ubuntu user to docker group
sudo usermod -aG docker ubuntu

# Pull and run your Docker container (replace image as needed)
sudo docker pull naveeng9/ecommerceapp-client:ads

sudo docker run \
  -e STRIPE_SECRET_KEY="sk_test_51SlYmEA6uC9s0stisDYJlWHtLiBvgfxLJy8EFVdr9meVCLs3VGvCzWaJoMVThlGH4QZYkw3eyj6pUvYg1aTvZIKX00qJMvalih" \
  -e NEXT_PUBLIC_BASE_URL="https://demowebserver.ngbandi.online" \
  -d \
  -p 3000:3000 \
  naveeng9/ecommerceapp-client:ads