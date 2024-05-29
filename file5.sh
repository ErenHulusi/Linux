#!/bin/bash

# Initialize an empty array to store the numbers
numbers=()

# Loop to gather numbers from the user until they type 'done'
while true; do
    read -p "Enter a number (or type 'done' to finish): " input
    if [ "$input" == "done" ]; then
        break
    fi
    numbers+=($input)
done

# Sort the numbers in numerical order
sorted_numbers=($(printf "%s\n" "${numbers[@]}" | sort -n))

# Print the sorted list of numbers
echo "Sorted numbers: ${sorted_numbers[@]}"
