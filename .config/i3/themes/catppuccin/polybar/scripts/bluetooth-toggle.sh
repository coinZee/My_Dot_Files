#!/bin/bash

# Get Bluetooth status
status=$(bluetoothctl show | grep "Powered:" | awk '{print $2}')

if [[ "$1" == "--toggle" ]]; then
    if [[ "$status" == "yes" ]]; then
        bluetoothctl power off
    else
        bluetoothctl power on
    fi
fi

# Print icon
if [[ "$status" == "yes" ]]; then
    echo ""
else
    echo "󰂲"
fi

