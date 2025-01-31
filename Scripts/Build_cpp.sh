#!/bin/bash

# Root directory of the project
ROOT_DIR="$PWD"

# Find and compile all .cpp files
find "$ROOT_DIR" -type f -name "*.cpp" | while read -r file; do
    # Get directory and filename without extension
    dir=$(dirname "$file")
    filename=$(basename "$file" .cpp)

    # Compile the file
    g++ "$file" -o "$dir/$filename.exe"

    # Check if compilation was successful
    if [ $? -eq 0 ]; then
        echo "Compiled: $file -> $dir/$filename.exe"
    else
        echo "Failed to compile: $file"
    fi
done

