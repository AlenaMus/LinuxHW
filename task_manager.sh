#!/bin/bash

# Define the file names for the logger and reader scripts
LOG_SCRIPT="log_time_backround.sh"
READ_SCRIPT="read_time_backround.sh"
LOG_FILE="time.log"

# Function to stop all background processes
cleanup() {
    echo "" # Newline for cleaner output
    echo "Stopping all tasks..."
    
    # Kill the logger process
    kill "$LOGGER_PID" 2>/dev/null
    
    # Kill the reader process
    kill "$READER_PID" 2>/dev/null
    
    echo "All background tasks have been stopped."
}

# Set up a trap to call the cleanup function on script exit
trap cleanup EXIT

echo "Starting the logging and reading tasks. Press 'q' to stop."
echo "--------------------------------------------------------"

# Run the logging script in the background, with its output redirected
./$LOG_SCRIPT > /dev/null 2>&1 &

# Store the Process ID (PID) of the logger
LOGGER_PID=$!

# Run the reader script in the background
# The reader's output will be shown in the current terminal
./$READ_SCRIPT &

# Store the Process ID (PID) of the reader
READER_PID=$!

# Wait for the user to press 'q' to stop the tasks
# Wait for the user to press 'q' to stop the tasks
while true; do
    read -rsn1 input
    if [[ "$input" = "q" ]]; then
        break
    fi
done
# The trap will automatically call the cleanup function to stop the scripts.
