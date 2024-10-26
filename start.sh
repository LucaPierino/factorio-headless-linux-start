#!/bin/bash
# Script for starting a headless Factorio server on Linux
# Author: Luca Pierino
# Repository: https://github.com/LucaPierino/factorio-headless-linux-start
# Version: 0.4

# Get the absolute path of the script's directory
script_dir=$(cd "$(dirname "$0")" && pwd)

# Check for --server-address argument
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --server-address) server_address="$2"; shift ;;
    esac
    shift
done

# Default server address if not specified
if [ -z "$server_address" ]; then
    server_address="0.0.0.0"
fi
echo "Using server address: $server_address"

# Define paths and command options for starting the server
factorio_dir="$script_dir/factorio/factorio"
settings_file="$script_dir/server-config.cfg"  # JSON config file, not sourced
admin_list="$factorio_dir/server-adminlist.json"
save_file="$factorio_dir/saves/new_game.zip"

# Add additional options for the command
command_options="--start-server $save_file --bind $server_address --server-settings $settings_file --server-adminlist $admin_list"

# Change working directory to the Factorio game directory
cd "$factorio_dir"

# Start the server in a detached screen session
screen -dmS factorio bash -c "sleep 5; exec ./bin/x64/factorio $command_options"

# Confirmation message
echo "Factorio server started successfully in a detached screen session."

