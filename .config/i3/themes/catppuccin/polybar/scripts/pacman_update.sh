#!/bin/bash
updates=$(checkupdates 2>/dev/null | wc -l)

if [ "$updates" -gt 0 ]; then
  echo "%{F#ff5555}$updates%{F-}"  # red if updates
else
  echo "%{F#888888}$updates%{F-}"  # grey if no updates
fi

