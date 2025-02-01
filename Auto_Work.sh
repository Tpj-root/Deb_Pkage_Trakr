#!/bin/bash

# Function to install software
install_software() {
    local software=$1

    # Check if the software is already installed
    if dpkg -l | grep -q "^ii  $software"; then
        echo "$software is already installed."
    else
        echo "Installing $software..."
        sudo apt update
        sudo apt install -y "$software"
    fi
}

# Function to read software list from Basic_software.list and install each
install_software_from_file() {
    local software_list_file="$1"

    if [[ -f "$software_list_file" ]]; then
        echo "Reading software list from $software_list_file..."

        while IFS=: read -r software description; do
            # Skip lines that start with #
            if [[ "$software" =~ ^# ]]; then
                continue
            fi

            # Extract the software name (ignore the description part)
            software=$(echo "$software" | xargs)  # Remove leading/trailing whitespace
            if [[ -n "$software" ]]; then
                install_software "$software"
            fi
        done < "$software_list_file"
    else
        echo "Software list file $software_list_file not found!"
    fi
}

# Path to the Basic_software.list file (assumed to be in the same directory as the script)
software_list_file="$(dirname "$0")/Basic_software.list"

# Install each software from the Basic_software.list file
install_software_from_file "$software_list_file"

echo "Script execution completed!"


add_aliases_from_file() {
    # Get the directory where the script is located
    local script_dir=$(dirname "$0")
    
    # Define the alias file path
    local alias_file="$script_dir/Alias_Backup.alias"
    
    if [[ -f "$alias_file" ]]; then
        echo "Adding aliases from $alias_file to ~/.bashrc..."
        cat "$alias_file" >> $HOME/.bashrc
    else
        echo "Alias file $alias_file not found!"
    fi
}
    
    
add_aliases_from_file






