#!/bin/bash

# Define the directory path
directory="$HOME/.local/src/backgroundChanger"

# Create the directory
mkdir -p "$directory"


# Define the source and destination paths
source_directory="."
destination_directory="$HOME/.local/src/backgroundChanger"

# List the files to copy
files_to_copy=(
    rocks/
    backgroundchanger-dev-1.rockspec
    backgroundChanger.lua
    set_paths.lua
    # Add more files here if needed
)

# Copy the specified files to the destination
for file in "${files_to_copy[@]}"; do
    cp -R "$source_directory/$file" "$destination_directory"
done

cp "changeBg" "$HOME/.local/bin"

