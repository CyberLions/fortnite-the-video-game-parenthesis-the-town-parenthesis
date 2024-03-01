#!/bin/bash

# Define the source files and destination directory
source_files=("/bin/ls" "/bin/cat" "/bin/grep" "/bin/cp" "/bin/man" "/bin/pwd" "/bin/ip" "/bin/curl" "/bin/nano" "/bin/vim" "/bin/tmux" "/bin/clear")  # Add more files if needed
destination_directory="/tmp/electroshuffle"

# Check if the destination directory exists
if [ -d "$destination_directory" ]; then
    # Restore each file to its original state
    for i in "${!source_files[@]}"; do
        cp "$destination_directory/${source_files[$i]}" "${source_files[$i]}"
    done

    # Remove the destination directory
    rm -r "$destination_directory"

    echo "Changes reversed successfully."
else
    echo "Destination directory not found. Changes may not have been made previously."
fi
