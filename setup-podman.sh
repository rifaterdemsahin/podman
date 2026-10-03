#!/bin/bash
set -e

echo "Starting Podman and Fly.io Setup..."

# Install Homebrew if not installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install podman and flyctl
echo "Installing Podman and Flyctl..."
brew install podman flyctl

# Initialize podman machine if not exists
if ! podman machine info &> /dev/null; then
    echo "Initializing Podman machine..."
    podman machine init --cpus 2 --memory 4096 --rootful=false
fi

# Start podman machine
echo "Starting Podman machine..."
podman machine start || true

# Check flyctl auth status
echo "Checking Fly.io authentication status..."
fly auth status || echo "Please run 'fly auth login' to authenticate."

echo "Setup complete! Podman and Fly.io are ready."
