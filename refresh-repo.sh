#!/bin/bash

# Function to print error messages and exit
error_exit() {
    echo "$1"
    exit 1
}

# Check if the directory path is provided
if [ -z "$1" ]; then
    error_exit "Please provide a directory location as an argument."
fi

DIR="$1"

# Check if the directory exists
if [ ! -d "$DIR" ]; then
    error_exit "The directory '$DIR' does not exist."
fi

# Resolve the absolute path of the directory
ABS_DIR=$(cd "$DIR" && pwd)

# Check if the directory is a git repository
if [ ! -d "$ABS_DIR/.git" ]; then
    error_exit "The directory '$DIR' is not a git repository."
fi

# Get the git remote URL
REMOTE_URL=$(git -C "$ABS_DIR" config --get remote.origin.url)
if [ -z "$REMOTE_URL" ]; then
    error_exit "No remote URL found in the git repository."
fi

# Print the remote URL (optional, for debugging)
echo "Git remote URL: $REMOTE_URL"

# Remove the directory and its contents
rm -rf "$ABS_DIR" || error_exit "Failed to remove the directory '$ABS_DIR'."

# Clone the repository again
git clone "$REMOTE_URL" "$ABS_DIR" || error_exit "Failed to clone the repository from '$REMOTE_URL'."

echo "Successfully cloned the repository from '$REMOTE_URL' to '$ABS_DIR'."
