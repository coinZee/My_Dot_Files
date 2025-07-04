#!/bin/bash
echo "Script executed" > ~/.config/i3/quit_or_tray.log

# Get the window under the cursor
window_id=$(xdotool getwindowfocus)

# Check if a valid window ID is retrieved
if [ -z "$window_id" ]; then
    echo "No focused window found" >> ~/.config/i3/quit_or_tray.log
    exit 1
fi

echo "Window ID: $window_id" >> ~/.config/i3/quit_or_tray.log

# Check if xprop can identify the discord window
window_class=$(xprop -id "$window_id" | grep WM_CLASS)
echo "Window Class: $window_class" >> ~/.config/i3/quit_or_tray.log

# Check for Discord
if echo "$window_class" | grep -q "discord"; then
    echo "Minimizing Discord" >> ~/.config/i3/quit_or_tray.log
    wmctrl -r "discord" -b add,hidden
else
    echo "Closing window" >> ~/.config/i3/quit_or_tray.log
    wmctrl -ic "$window_id"
fi

