# Podman & Fly.io Local Debug Environment (ArangoDB Edition)

This project provides a set of tools and configurations to run and debug containers locally on macOS using **Podman**, tailored for deploying to **Fly.io**, with a specific focus on running **ArangoDB** (https://arango.ai).

## Features
- **Podman Native**: Runs purely on Podman (`podman-machine`) - No Docker Desktop.
- **ArangoDB Support**: Local instance of ArangoDB for Multi-Model Graph and Document database prototyping.
- **Local Dashboard**: A simple `index.html` UI for container status and staged documentation.

## Setup Stages

### Stage 1: Initialize Podman
Run the setup script or run commands manually to install dependencies and initialize Podman.
```bash
brew install podman flyctl
podman machine init --cpus 2 --memory 4096 --rootful=false
podman machine start
```

### Stage 2: Deploy ArangoDB Container
We use Podman to pull and run ArangoDB.
```bash
podman run -d -p 8529:8529 -e ARANGO_ROOT_PASSWORD=password --name arango arangodb
```
*You can access the ArangoDB Web Interface by going to `http://localhost:8529` (User: `root`, Password: `password`).*

### Stage 3: Dashboard Interface
You can run a local server to view the dashboard and logs:
```bash
python3 -m http.server 30080
```
Navigate to `http://localhost:30080` to view the emulated container statuses and ArangoDB use cases.

## Git Workflow
To commit and push changes:
```bash
git add .
git commit -m "Update Podman and ArangoDB configurations"
git push origin main
```
