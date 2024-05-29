#!/bin/bash

# Prompt for the username and ensure a valid input is provided
while [ -z "$username" ]; do
    read -p "Please enter a username: " username
    if [ -z "$username" ]; then
        echo "You didn't enter a username. Please try again."

    fi
done

# Retrieve the user ID and groups for the provided username
user_id=$(id -u "$username" 2>/dev/null)
user_groups=$(id -Gn "$username" 2>/dev/null)

# Check if the user exists and print their ID and groups
if [ $? -eq 0 ]; then
    echo "User ID: $user_id"
    echo "Groups: $user_groups"
else
    echo "User '$username' does not exist."
fi

