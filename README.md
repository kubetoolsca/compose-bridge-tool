# Deploy Voting app to Kubernetes using Compose Bridge

A simple distributed application running across multiple Docker containers.

## Prerequsiite

- Docker Desktop
- Enable Compose Bridge
- Enable Kubernetes

## Getting Started

## Clone the repo

```
git clone https://github.com/kubetoolsca/sample-voting-app
```

## 2. Change directory

```
cd sample-voting-app
```

## 3. Let's target voting service.

```
cd vote
```

Change Dockerfile to the following

```
# Define a base stage that uses the official python runtime base image
FROM python:3.11-slim AS base

# Add curl for healthcheck
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl && \
    rm -rf /var/lib/apt/lists/*

# Set the application directory
WORKDIR /usr/local/app

# Install our requirements.txt
COPY requirements.txt ./requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Define a log simulation script for simulating logs
COPY simulate_logs.sh /usr/local/bin/simulate_logs.sh
RUN chmod +x /usr/local/bin/simulate_logs.sh

# Define a stage specifically for development, where it'll watch for
# filesystem changes
FROM base AS dev
RUN pip install watchdog
ENV FLASK_ENV=development

# Run both the app and the log simulation script concurrently
CMD ["sh", "-c", "/usr/local/bin/simulate_logs.sh & python app.py"]

# Define the final stage that will bundle the application for production
FROM base AS final

# Copy our code from the current folder to the working directory inside the container
COPY . .

# Make port 80 available for links and/or publish
EXPOSE 80

# Run both gunicorn and the log simulation script concurrently
CMD ["sh", "-c", "/usr/local/bin/simulate_logs.sh & gunicorn app:app -b 0.0.0.0:80 --log-file - --access-logfile - --workers 4 --keep-alive 0"]
```

4. Add Log Simulation Script:


```
#!/bin/bash

while true; do
  echo "$(date +'%Y-%m-%d %H:%M:%S') INFO: Simulated vote log message."
  sleep 2
done
```

5. Change directory

```
cd ../vote/
```
6. Convert docker compose to Kubernetes

```
compose-bridge convert
```

7.

```
kubectl apply -k out/overlays/desktop/
```

8. Check krs health > enter model name> Choose "example-voting-app" to see the logs (edited) (edited) 

