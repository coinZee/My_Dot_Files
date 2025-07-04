
#!/bin/bash

# Get battery status
status=$(acpi -b | awk '{print $3}' | sed 's/,//')  # Get battery status (Charging/Discharging)

# Get battery capacity
cap=$(acpi -b | awk '{print $4}' | sed 's/%//')  # Get battery percentage

# Adjust power settings based on battery status
if [[ "$status" == "Discharging" ]]; then
    # On battery
    sudo tlp setcharge 80  # Set battery charge threshold to 80% if using TLP
    sudo tlp cpu-boost 0   # Disable CPU boost (powersave mode)
    bluetoothctl power off
    nmcli radio wifi off
elif [[ "$status" == "Charging" || "$status" == "Full" ]]; then
    # On plugged in
    sudo tlp setcharge 80  # Set charge threshold to 80% if using TLP
    sudo tlp cpu-boost 1   # Enable CPU boost (performance mode)
fi

# Print icon based on battery capacity
if [[ "$status" == "Discharging" ]]; then
    if (( cap >= 75 )); then
        echo "󰂀"  # Full battery icon
    elif (( cap >= 65 )); then
        echo "󰁿"  # 65% battery icon
    elif (( cap >= 40 )); then
        echo "󰁼"  # 40% battery icon
    elif (( cap >= 20 )); then
        echo "󰁻"  # Low battery icon
    else
        echo "󰂂"  # Critical battery icon
    fi
elif [[ "$status" == "Charging" || "$status" == "Full" ]]; then
    echo "󰁹"  # Charging icon (plugged in)
fi

