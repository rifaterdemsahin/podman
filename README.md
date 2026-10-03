# Podman & Fly.io Local Debug Environment

This project provides a set of tools and configurations to run and debug containers locally on macOS (Intel or Apple Silicon) using **Podman** instead of Docker Desktop, tailored for deploying to **Fly.io**.

## Features
- **No Docker Desktop required**: Runs purely on Podman (`podman-machine`).
- **Fly.io Compatibility**: Designed to test images intended for Fly.io deployments.
- **Cross-Architecture Support**: Built to handle `linux/amd64` using QEMU emulation if on Apple Silicon.
- **Local Dashboard**: A simple `index.html` UI for container and status tracking.

## Setup Instructions

### 1. Initialize Podman and Flyctl
Run the included setup script to install dependencies, initialize Podman, and check Fly authentication:
```bash
chmod +x setup-podman.sh
./setup-podman.sh
```

### 2. Emulating Fly.io locally
Use `flyctl` to fetch configuration and test locally with Podman. To build your Fly app locally:
```bash
# Pull the latest image of your Fly app
fly image show

# Or build the app locally without deploying
fly deploy --local-only
```

### 3. Run the Debug Dashboard
You can run a local server to view the dashboard:
```bash
python3 -m http.server 30080
```
Then navigate to `http://localhost:30080` in Google Chrome to view the emulated container statuses.

## Git Workflow
To commit and push changes:
```bash
git add .
git commit -m "Update Podman and Fly.io configuration"
git push origin main
```
