# Network Connection Monitor

A shell script to monitor network connection drops and ping data usage on macOS. The script continuously pings a specified target and logs connection status and data usage to separate log files for analysis.

## Installation

1. Clone or download this repo to your local machine.

2. Open Terminal and navigate to the directory where you cloned or downloaded the repository.

3. Make the script executable by running the following command:
   ```
   chmod +x connection_monitor.sh
   ```

## Usage

1. Open the `connection_monitor.sh` script in a text editor.

2. You can modify the following variables according to your requirements:
   - `ping_target`: The IP address or domain name to ping (default is "8.8.8.8" for Google's DNS server).
   - `ping_interval`: The interval in seconds between each ping (default is 5 seconds).
   - `log_file`: The name of the file where connection status will be logged (default is "connection_log.txt").
   - `data_usage_file`: The name of the file where ping data usage will be logged (default is "data_usage_log.txt").

3. Save the changes to the script.

4. Run the script by executing the following command in Terminal:
   ```
   ./connection_monitor.sh
   ```

   The script will start monitoring the network connection and logging the results.

5. To stop the script, press `Ctrl+C` in the Terminal.

## Log Files

The script generates two log files:

1. `connection_log.txt`: This file contains the connection status logs. Each line represents a ping attempt and indicates whether the connection was "UP" or "DOWN" at that timestamp.

2. `data_usage_log.txt`: This file contains the ping data usage logs. Each line represents a successful ping attempt and includes the timestamp and the amount of data used by that ping in bytes.

## Analyzing Log Files

You can analyze the log files to determine the frequency of connection drops and monitor the data usage over time. Here are a few examples:

- To count the number of connection drops:
  ```
  grep "Connection DOWN" connection_log.txt | wc -l
  ```

- To calculate the total data usage:
  ```
  awk '{sum+=$NF} END {print sum}' data_usage_log.txt
  ```

- To view the data usage for each ping:
  ```
  cat data_usage_log.txt
  ```

Feel free to use other commands and tools to analyze the log files based on your specific requirements.

## Notes

- The script uses the `ping` command to monitor the network connection. Ensure that you have the necessary permissions to run the `ping` command.

- The data usage logged by the script only includes the data used by the ping command itself, which is typically small. It does not account for other network traffic on your system.

- The script runs indefinitely until manually stopped. Make sure to monitor the log file sizes and disk space usage, especially if running the script for an extended period.

## License

This project is licensed under the [MIT License](LICENSE).
