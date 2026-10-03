# Podman, Fly.io & ArangoDB Local Debug Environment

[![Deploy static content to Pages](https://github.com/rifaterdemsahin/podman/actions/workflows/pages.yml/badge.svg)](https://github.com/rifaterdemsahin/podman/actions/workflows/pages.yml)
[![Live Dashboard](https://img.shields.io/badge/Live-GitHub_Pages-blue)](https://rifaterdemsahin.github.io/podman/)

This project provides a complete set of tools, configurations, and documentation to run and debug containers locally on macOS using **Podman**, tailored for edge deployments to **Fly.io**, with a focus on running **ArangoDB** for Multi-Model architectures.

🌐 **[View the Live Documentation & Dashboard Here](https://rifaterdemsahin.github.io/podman/)**

## 🚀 Features
- **Podman Native**: Runs purely on Podman (`podman-machine`) - No Docker Desktop required.
- **ArangoDB Support**: Local instance of ArangoDB for Multi-Model Graph and Document database prototyping.
- **Static Dashboard UI**: A built-in local dashboard featuring system statuses, architecture diagrams, and concept guides.
- **Global Search**: Navigate through concepts easily via the integrated search bar.
- **Fly.io Ready**: Includes `fly.toml` and `Dockerfile` to deploy the entire documentation and dashboard interface natively to the cloud.

## 🛠️ Hands-On: Setup Stages

### Stage 1: Initialize Podman
Run the setup script or run commands manually to install dependencies and initialize Podman on macOS.
```bash
brew install podman flyctl
podman machine init --cpus 2 --memory 4096 --rootful=false
podman machine start
```
*Expected Output:*
> `Machine "podman-machine-default" started successfully`

### Stage 2: Deploy ArangoDB Container
We use Podman to pull and run ArangoDB locally.
```bash
podman run -d -p 8529:8529 -e ARANGO_ROOT_PASSWORD=password --name arango arangodb
```
*You can access the ArangoDB Web Interface by going to `http://localhost:8529` (User: `root`, Password: `password`).*

### Stage 3: Dashboard Interface
You can run a local server to view the dashboard and logs:
```bash
python3 -m http.server 30080
```
Navigate to `http://localhost:30080` to view the emulated container statuses.

### Stage 4: Deploying to Fly.io
The dashboard is configured for direct deployment to Fly.io. To push it live:
```bash
fly auth login
fly deploy
fly open
```

## 📖 Navigation & Concept Pages
The local dashboard contains several pages to help you understand the architecture:
- [`index.html`](https://rifaterdemsahin.github.io/podman/index.html): Main dashboard and status checker.
- [`usecases.html`](https://rifaterdemsahin.github.io/podman/usecases.html): Architectural diagrams and why we use this stack.
- [`podman.html`](https://rifaterdemsahin.github.io/podman/podman.html): Deep dive into Podman vs Docker Desktop.
- [`flyio.html`](https://rifaterdemsahin.github.io/podman/flyio.html): Explanation of Fly.io edge networking.
- [`arangodb.html`](https://rifaterdemsahin.github.io/podman/arangodb.html): Multi-model database concepts and Graph Neural Networks.
- [`first-principles.html`](https://rifaterdemsahin.github.io/podman/first-principles.html): Fundamental explanations behind containers, edge computing, and multi-model data.
- [`metadata.html`](https://rifaterdemsahin.github.io/podman/metadata.html): Explanation of local data isolation with Podman using NZ Energy Council mock data.

## 💻 Git Workflow
To commit and push changes:
```bash
git add .
git commit -m "Update Podman and ArangoDB configurations"
git push origin main
```
