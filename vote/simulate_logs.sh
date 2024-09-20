#!/bin/bash

while true; do
  # Generate a random number between 1 and 10
  random_number=$(( (RANDOM % 10) + 1 ))

  # If the random number is 1 (10% chance), print an ERROR message
  if [ $random_number -eq 1 ]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') ERROR: Simulated vote error occurred."
  else
    # Otherwise, print an INFO message
    echo "$(date +'%Y-%m-%d %H:%M:%S') INFO: Simulated vote log message."
  fi

  # Sleep for 2 seconds before generating the next log
  sleep 2
done
