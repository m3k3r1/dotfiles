#!/bin/bash

TOTAL_RAM=$(sysctl -n hw.memsize)
TOTAL_RAM_MB=$(($TOTAL_RAM / 1024 / 1024))
USED_RAM=$(top -l 1 | awk '/PhysMem/ {print $6}' | sed 's/M//')

RAM_PERCENT="$(echo "$TOTAL_RAM_MB $USED_RAM" | awk '{printf "%.0f\n", ($2*100)/$1}')"

# Update the Sketchybar label
sketchybar --set $NAME label="$RAM_PERCENT%"