#!/bin/bash

# Prompt the user for the name of a directory and ensure input is provided
while [ -z "$dirName" ]; do
    read -p "Enter a directory name: " dirName
    if [ -z "$dirName" ]; then
        echo "You didn't enter a directory name, please try again."

    fi
done

# Check if the directory exists and report information
if [ -d "$dirName" ]; then
    # Count the number of files in the directory
    num_files=$(find "$dirName" -type f | wc -l)

    # Get the last edited timestamp of the directory
    last_edited=$(stat -c %y "$dirName")

    # Find the largest file in the directory
    largest_file=$(find "$dirName" -type f -exec du -h {} + | sort -rh | head -n 1)

    # Find the smallest file in the directory
    smallest_file=$(find "$dirName" -type f -exec du -h {} + | sort -h | head -n 1)

    # Display the gathered information
    echo "Number of files: $num_files"
    echo "Last edited: $last_edited"
    echo "Largest file: $largest_file"
    echo "Smallest file: $smallest_file"
else
    echo "Directory $dirName does not exist."
fi
