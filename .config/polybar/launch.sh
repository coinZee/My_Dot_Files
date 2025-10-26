#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using the 'main' bar from the config file
echo "---" | tee -a /tmp/polybar-main.log
polybar main >>/tmp/polybar-main.log 2>&1 &

echo "Polybar launched..."

