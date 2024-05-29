#!/bin/bash

# Function to check if the input is a valid number
check_number() {
    local input="$1"
    [[ $input =~ ^[0-9]+$ ]]
}

# Prompt the user for a number until a valid number is entered
while true; do
    read -p "Please enter a number: " number
    if check_number "$number"; then
        break
    else
        echo "Invalid input. Please enter a valid number."
    fi
done

# Create an array holding values from 1 to the given user number
numbers=($(seq 1 $number))

# Loop through each number in the array
for num in "${numbers[@]}"; do
    if (( num % 3 == 0 && num % 5 == 0 )); then
        echo "FizzBuzz!"
    elif (( num % 3 == 0 )); then
        echo "Fizz!"
    elif (( num % 5 == 0 )); then
        echo "Buzz!"
    else
        echo $num
    fi
done
