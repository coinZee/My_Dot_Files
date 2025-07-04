#!/usr/bin/env sh

pkill polybar && sleep 1
polybar --reload -c ~/.config/i3/themes/catppuccin/polybar/config.ini &
