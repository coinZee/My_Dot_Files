#!/bin/bash

# Kill stuff that eats FPS
killall picom
killall polybar
xrandr --output eDP-1 --mode 1280x720
# sudo cpupower frequency-set -g performance
# sudo tlp
# sudo auto-cpufreq --force performance

# Set CPU governor to performance
# for cpu in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do
#     echo performance | sudo tee "$cpu"
# done
#
# Set Intel GPU to performance
# echo 0 | sudo tee /sys/class/drm/card0/device/power_dpm_force_performance_level 2>/dev/null
# echo 1 | sudo tee /sys/devices/pci*/drm/card0/power/control 2>/dev/null

# Optional: disable Wi-Fi power saving
# nmcli radio wifi off

# Launch minimal Polybar
polybar -c ~/.config/i3/themes/catppuccin/polybar/gaming_config.ini gaming &

