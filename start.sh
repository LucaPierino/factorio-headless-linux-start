#!/bin/bash
# Script for starting a headless Factorio server on Linux
# Author: Luca Pierino
# Repository: https://github.com/LucaPierino/factorio-headless-linux-start
# Version: 0.3

# Get the absolute path of the script's directory
script_dir=$(cd "$(dirname "$0")" && pwd)

# Load configuration file
# If the configuration file exists, load the options from it
config_file="$script_dir/server-config.cfg"
if [ -f "$config_file" ]; then
    source "$config_file"
fi

# OVERRIDE DEFAULT SERVER ADDRESS WITH CUSTOM VALUE
# If the server_address variable is set in the configuration file,
# use that value instead of the default "0.0.0.0" value
if [ -n "$server_address" ]; then
    echo "Using custom server address: $server_address"
fi

# Define command options for starting the server
command_options="--start-server-load-latest --bind ${server_address:-0.0.0.0} --server-settings $script_dir/factorio/data/server-settings.json"

# Add optional command line arguments if specified in config file
if [ -n "$extra_command_options" ]; then
    command_options+=" $extra_command_options"
fi

# Change working directory to the game directory
cd "$script_dir/factorio"

# Start the server
screen -dmS factorio bash -c "sleep 5; exec ./bin/x64/factorio $command_options"
