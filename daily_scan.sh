#!/bin/bash

# Function to back up the dpkg package list with today's date
backup_dpkg_list() {
    # Get today's date in the format YYYY-MM-DD
    local today=$(date +%F)

    # Define the backup folder and file path (within the current directory)
    local backup_folder="./dpkg_backup"
    local backup_file="$backup_folder/dpkg_list_$today.txt"

    # Create the backup folder if it doesn't exist
    mkdir -p "$backup_folder"

    # Run dpkg -l and save the output to the backup file
    sudo dpkg -l > "$backup_file"

    # Inform the user
    echo "Package list backed up to $backup_file"
}


backup_bashrc() {
    # Get today's date in the format YYYY-MM-DD
    local today=$(date +%F)

    # Define the backup folder and file path (within the current directory)
    local backup_folder="./Alias_backup"
    local backup_file="$backup_folder/bashrc_$today"

    # Create the backup folder if it doesn't exist
    mkdir -p "$backup_folder"

    # Copy the ~/.bashrc to the backup file
    cp ~/.bashrc "$backup_file"

    # Inform the user
    echo "~/.bashrc backed up to $backup_file"
}


backup_hosts() {
    # Get today's date in the format YYYY-MM-DD
    local today=$(date +%F)

    # Define the backup folder and file path (within the current directory)
    local backup_folder="./host"
    local backup_file="$backup_folder/hosts_$today"

    # Create the backup folder if it doesn't exist
    mkdir -p "$backup_folder"

    # Copy the ~/.bashrc to the backup file
    cp /etc/hosts "$backup_file"

    # Inform the user
    echo "~/.bashrc backed up to $backup_file"
}





# Call the function to back up the package list
backup_dpkg_list
#backup_bashrc
backup_hosts
