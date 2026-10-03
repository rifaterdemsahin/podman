FROM python:3.11-slim
WORKDIR /app
COPY . .
# Start a simple python web server on port 8080
CMD ["python3", "-m", "http.server", "8080"]
EXPOSE 8080
