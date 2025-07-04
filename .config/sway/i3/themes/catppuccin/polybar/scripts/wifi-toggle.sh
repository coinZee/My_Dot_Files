#!/bin/bash

# Get Wi-Fi status
status=$(nmcli radio wifi)

if [[ "$1" == "--toggle" ]]; then
    if [[ "$status" == "enabled" ]]; then
        nmcli radio wifi off
    else
        nmcli radio wifi on
    fi
fi

# Print icon
if [[ "$status" == "enabled" ]]; then
    echo ""
else
    echo "󰖪"
fi

