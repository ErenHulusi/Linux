#!/bin/bash


while [ -z "$username" ]; do
 
        echo "please enter your name"
        read username
        if [ -z "$username" ]; then
                echo "You have not entered your name, Please enter your name"
        fi
done

now=$(pwd)

mkdir "WAT_${username}"

cd "WAT_${username}"

touch file1.txt file2.txt file3.txt

echo "you can see some text here" > file1.txt

mkdir childDir

cp file1.txt childDir/


echo "${username} Directory and files have been created."

