#!/bin/bash

# Define the source files and destination directory
source_files=("/bin/ls" "/bin/cat" "/bin/grep" "/bin/cp" "/bin/man" "/bin/pwd" "/bin/ip" "/bin/curl" "/bin/nano" "/bin/vim" "/bin/tmux" "/bin/clear")  # Add more files if needed
destination_directory="/tmp/electroshuffle"

# Create the destination directory if it doesn't exist
mkdir -p "$destination_directory"

# Copy source files to the destination directory
for file in "${source_files[@]}"; do
    cp "$file" "$destination_directory"
done

# Shuffle the order of the source files
shuffled_files=($(shuf -e "${source_files[@]}"))

# Replace each file in shuffled order
for i in "${!source_files[@]}"; do
    cp "${shuffled_files[$i]}" "${source_files[$i]}"
done

echo "Files copied to $destination_directory and swapped."
