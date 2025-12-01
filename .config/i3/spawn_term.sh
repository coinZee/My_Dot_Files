#!/bin/bash

# 1. Get the class or app_id of the focused window
# We try swaymsg first (Wayland), if that fails, we assume X11 (i3) and use xdotool.
if command -v swaymsg >/dev/null 2>&1 && [ -n "$SWAYSOCK" ]; then
    # Wayland / Sway method
    FOCUSED_APP=$(swaymsg -t get_tree | jq -r '.. | select(.focused? == true) | .app_id // .window_properties.class')
else
    # X11 / i3 method (requires xdotool)
    FOCUSED_APP=$(xdotool getwindowfocus getwindowclassname)
fi

# 2. Check if it's Alacritty (case insensitive just in case)
if [[ "$FOCUSED_APP" =~ [Aa]lacritty ]]; then
    # It IS a terminal. Try to get its path.
    # We use || true to prevent the script from crashing if xcwd fails
    TARGET_DIR=$(xcwd 2>/dev/null || true)
fi

# 3. Validation: If TARGET_DIR is empty or not a real folder, fallback to Home
if [ -z "$TARGET_DIR" ] || [ ! -d "$TARGET_DIR" ]; then
    TARGET_DIR="$HOME"
fi

# 4. Launch the new terminal
alacritty --working-directory "$TARGET_DIR"
