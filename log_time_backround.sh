#!/bin/bash

# Define the log file name
LOG_FILE="time.log"

# 1. Create a new or truncate an existing log file and ensure it has write permissions
touch "$LOG_FILE"
chmod +w "$LOG_FILE"
echo "Starting time logging to '$LOG_FILE'."

# 2. Run an infinite loop in the background to write the current time
# The & at the end detaches the loop from the current terminal,
# allowing the script to proceed to the 'read' command.
while true
do
    echo "Current time: $(date)" >> "$LOG_FILE"
    sleep 10
done &

# 3. Store the Process ID (PID) of the background process
PID=$!

# The script is now ready to be run in the background. It will keep running until
# it's terminated by a signal from a parent process or user command.
# There is no user input required here.
