#!/bin/bash

# Simulated user vote data
candidates=("Candidate_A" "Candidate_B" "Candidate_C")
users=("user1" "user2" "user3" "user4" "user5")

# Function to simulate voting logs
log_vote() {
  user=${users[$((RANDOM % ${#users[@]}))]}
  candidate=${candidates[$((RANDOM % ${#candidates[@]}))]}
  echo "$(date +'%Y-%m-%d %H:%M:%S') INFO: User '$user' voted for '$candidate'."
}

# Function to simulate a warning log
log_warning() {
  echo "$(date +'%Y-%m-%d %H:%M:%S') WARNING: Slow response detected from Redis."
}

# Function to simulate an error log
log_error() {
  error_type=$((RANDOM % 3))
  case $error_type in
    0) echo "$(date +'%Y-%m-%d %H:%M:%S') ERROR: Failed to connect to the database." ;;
    1) echo "$(date +'%Y-%m-%d %H:%M:%S') ERROR: Invalid vote data received from user." ;;
    2) echo "$(date +'%Y-%m-%d %H:%M:%S') ERROR: Redis service unavailable." ;;
  esac
}

# Main loop to generate logs
while true; do
  # Generate a random number to determine log type
  log_type=$((RANDOM % 10))

  # Simulate different log types
  if [ $log_type -lt 6 ]; then
    log_vote  # INFO: Normal vote log
  elif [ $log_type -lt 8 ]; then
    log_warning  # WARNING: Slow Redis or other issues
  else
    log_error  # ERROR: Random application error
  fi

  # Sleep for a short interval before generating the next log
  sleep 2
done
