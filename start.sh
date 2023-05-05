#!/bin/bash
# Script for starting a headless installation of Factorio on Linux
# Author: Luca Pierino
# Repository: https://github.com/LucaPierino/factorio-headless-linux-start
# Version: 0.2

# Factorio installation directory
factorio_path=$(realpath "$(dirname "$0")/../factorio")
echo "Factorio directory: $factorio_path"

# Check if Factorio is already running
if pgrep factorio >/dev/null 2>&1 ; then
    echo "Factorio server is already running."
    exit 1
fi

# Check if Factorio is installed
if [ ! -f "$factorio_path/bin/x64/factorio" ]; then
    echo "Factorio is not installed in the specified directory."
    exit 1
fi

# Ask for the server address
read -p "Enter the server address (default: 0.0.0.0): " server_address
server_address=${server_address:-0.0.0.0}

# Set the command-line options for starting the server
command_options="--start-server-load-latest --bind $server_address --server-settings $factorio_path/data/server-settings.json"

# Print the command-line options and ask for confirmation
echo "The following command-line options will be used to start the Factorio server:"
echo "$command_options"
read -p "Do you want to continue? [y/n]: " confirm
if [ "$confirm" != "y" ]; then
    echo "Server start cancelled by user."
    exit 0
fi

# Start the Factorio server using screen
echo "Starting Factorio server..."
screen -dm bash -c "sleep 5; exec $factorio_path/bin/x64/factorio $command_options"

# Print completion message
echo "Factorio server has been started."

