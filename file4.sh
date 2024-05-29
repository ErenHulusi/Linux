#!/bin/bash

# Display all active processes
ps -e

# Function to check if the input is a valid number
check_number() {
    local input="$1"
    [[ $input =~ ^[0-9]+$ ]]
}

# Prompt the user for a process ID until a valid number is entered
while true; do
    read -p "Please enter the process ID (PID) you want to stop: " pid
    if check_number "$pid"; then
        break
    else
        echo "Invalid input. Please enter a valid process ID (PID)."
    fi
done

# Attempt to stop the process with the given PID
kill $pid

# Provide feedback on whether the process was successfully stopped
if [ $? -eq 0 ]; then
    echo "Process $pid has been stopped."
else
    echo "Failed to stop process $pid. Ensure you have the necessary permissions and that the PID exists."
fi
