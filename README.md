# Factorio Headless Linux Start Script

This is a simple script for starting a headless Factorio server on Linux. It includes options for specifying a custom server address, additional command line arguments, and more. 

## Requirements

* A Linux operating system
* A working installation of Factorio (see [Factorio's download page](https://www.factorio.com/download) for instructions)

## Configuration

To configure the script, create a file named `server-config.cfg` in the same directory as the `start.sh` script. The following variables can be set in the configuration file:

* `server_address`: The IP address or hostname to bind the server to. Default is `0.0.0.0`.
* `extra_command_options`: Any additional command line options to be passed to the `factorio` executable.

## Usage

1. Make sure the `start.sh` script is executable: `chmod +x start.sh`
2. Run the script: `./start.sh`

The script will automatically load any configuration options set in the `server-config.cfg` file. If no configuration file is found, default values will be used.

## Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
