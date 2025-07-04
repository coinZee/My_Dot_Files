#!/bin/bash

killall polybar

xrandr --output eDP-1 --mode 1920x1080

# Start compositor
# echo powersave | sudo tee /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor  

~/.config/i3/themes/catppuccin/scripts/launch_polybar.sh
picom --config ~/.config/i3/themes/catppuccin/picom/picom.conf
# sudo cpupower frequency-set -g powersave
# sudo auto-cpufreq --force powersave

# Kill gaming polybar

# Start full polybar
