#!/bin/bash

# Define the log file name
LOG_FILE="time.log"

# Function to clean up the background process when the script exits
cleanup() {
    echo "Stopping the log file reader..."
    # Kill the background process using its PID
    kill "$PID" 2>/dev/null
    echo "Script stopped."
}

# Set up a trap to call the cleanup function on script exit (e.g., Ctrl+C or Enter)
trap cleanup EXIT

echo "Starting to read '$LOG_FILE' every 7 seconds. Press Enter to stop."

# Run an infinite loop in the background to read and print the log file
# The & at the end detaches the loop from the current terminal,
# allowing the script to proceed to the 'read' command.
while true
do
    echo "--- Last line of $LOG_FILE at $(date) ---"
    # Use tail -1 to read and print only the last line of the file
    tail -1 "$LOG_FILE"
    echo "------------------------------------------------------"
    sleep 7
done &

# Store the Process ID (PID) of the background process
PID=$!

# Wait for user input (pressing Enter) to stop the script
read -r

# The script will now call the cleanup function automatically.
