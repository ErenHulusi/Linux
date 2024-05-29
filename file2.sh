#!/bin/bash

# Function to check if the input is a number
check_number() {
    local input="$1"
    [[ $input =~ ^[0-9]+$ ]]
}

# Loop until a valid number is entered
while true; do
    read -p "Please type a number: " number

    if check_number "$number"; then
        break
    else
        echo "That's incorrect number. Please try again."
    fi
done

# Determine if the number is odd or even
if (( number % 2 == 0 )); then
    results="$number is even"
else
    results="$number is odd"
fi

# Change to the user's WAT directory
cd WAT_*/

# Store the result in file3.txt
echo $results > file3.txt
echo $results

# Ask the user if they want to delete file3.txt
read -p "Do you want to remove file3.txt? (y/n): " choice
if [ "$choice" == "y" ]; then
    rm file3.txt
else
    # Ensure the file exists (touch) and rename it
    touch file3.txt
    mv file3.txt changedFileName.txt
    # Move the renamed file to the home directory
    mv changedFileName.txt ~/
fi
