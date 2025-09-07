#!/bin/bash

# Define the log file name
LOG_FILE="time.log"

# Function to clean up the background process when the script exits
cleanup() {
    echo "Stopping the time logging..."
    # Kill the background process using its PID
    kill "$PID" 2>/dev/null
    echo "Script stopped. The log file is located at: $LOG_FILE"
}

# Set up a trap to call the cleanup function on script exit (e.g., Ctrl+C or Enter)
trap cleanup EXIT

# 1. Create a new or truncate an existing log file and ensure it has write permissions
touch "$LOG_FILE"
chmod +w "$LOG_FILE"
echo "Starting time logging to '$LOG_FILE'. Press Enter to stop."

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

# 4. Wait for user input (pressing Enter) to stop the script
read -r

# The script will now call the cleanup function automatically.