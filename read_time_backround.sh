#!/bin/bash

# Define the log file name
LOG_FILE="time.log"

echo "Starting to read '$LOG_FILE' every 7 seconds."

# Run an infinite loop to read and print the log file.
# This loop will now run in the foreground when called.
while true
do
    echo "--- Last line of $LOG_FILE at $(date) ---"
    # Use tail -1 to read and print only the last line of the file
    tail -1 "$LOG_FILE"
    echo "------------------------------------------------------"
    sleep 7
done
