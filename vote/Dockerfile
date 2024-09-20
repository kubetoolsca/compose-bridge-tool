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
