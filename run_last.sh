#!/bin/bash

# Change to the main directory
cd ~/Desktop/GIT_MAIN || exit

# Flag to track if any changes are detected
changes_detected=false

# Loop through each folder in the directory
for folder in */; do
    # Navigate to the folder
    cd "$folder" || continue

    # Check git status and capture the output
    status=$(git status --porcelain)

    # If there are any changes, print the folder name in red
    if [[ -n "$status" ]]; then
        echo -e "Changes detected in folder: \033[31m$folder\033[0m"
        changes_detected=true
    fi

    # Go back to the main directory
    cd ..
done

# If no changes were detected, print the green message
if ! $changes_detected; then
    echo -e "\033[32mThere is no change where there is no action.\033[0m"
fi

