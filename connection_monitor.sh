#!/bin/bash

ping_target="8.8.8.8"
ping_interval=5  # Ping interval in seconds
log_file="connection_log.txt"

echo "Monitoring connection drops..."
echo "Ping target: $ping_target"
echo "Ping interval: $ping_interval seconds"
echo "Log file: $log_file"

while true; do
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")
    if ping -c 1 -W 1 $ping_target >/dev/null; then
        echo "$timestamp - Connection UP" >> $log_file
    else
        echo "$timestamp - Connection DOWN" >> $log_file
    fi
    sleep $ping_interval
done
