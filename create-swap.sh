#!/bin/bash

# Step 1: Determine Linux distribution and version
echo "Checking Linux distribution and version..."
if [ -f /etc/os-release ]; then
    # For modern Linux distributions
    . /etc/os-release
    echo "Distribution: $NAME"
    echo "Version: $VERSION"
else
    echo "Unable to determine distribution. Please check manually."
    exit 1
fi

# Step 2: Ask the user how much swap memory they want to create
read -p "Enter the amount of swap memory to create (in GB): " SWAP_SIZE

# Convert GB to MB
SWAP_SIZE_MB=$((SWAP_SIZE * 1024))

# Step 3: Create swap memory
echo "Creating ${SWAP_SIZE}GB of swap memory..."

# Check if a swap file already exists
if grep -q "swapfile" /etc/fstab; then
    echo "Swap file already exists. Exiting."
    exit 1
fi

# Create the swap file
sudo fallocate -l "${SWAP_SIZE_MB}M" /swapfile

# Set the right permissions for the swap file
sudo chmod 600 /swapfile

# Set up the swap area
sudo mkswap /swapfile

# Enable the swap
sudo swapon /swapfile

# Add the swap file to /etc/fstab to make it persistent
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

# Verify the swap is active
echo "Swap created successfully!"
swapon --show
free -h

