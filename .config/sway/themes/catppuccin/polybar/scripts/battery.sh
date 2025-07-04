
#!/bin/bash

bat0="/org/freedesktop/UPower/devices/battery_BAT0"
bat1="/org/freedesktop/UPower/devices/battery_BAT1"

info0=$(upower -i "$bat0")
info1=$(upower -i "$bat1")

cap0=$(echo "$info0" | awk '/percentage/ {gsub("%", "", $2); print $2}')
cap1=$(echo "$info1" | awk '/percentage/ {gsub("%", "", $2); print $2}')

state0=$(echo "$info0" | awk '/state/ {print $2}')
state1=$(echo "$info1" | awk '/state/ {print $2}')

# avg capacity
capacity=$(( (cap0 + cap1) / 2 ))

# icon selection
if [[ "$state0" == "charging" || "$state1" == "charging" ]]; then
    icon="󰂄"
elif (( capacity > 75 )); then icon="󰂀"
elif (( capacity < 65 )); then icon="󰁾"
elif (( capacity < 40 )); then icon="󰁼"
elif (( capacity < 20 )); then icon="󰁻"
else icon="󰂂"
fi

echo "$capacity% $icon"

