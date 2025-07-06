#!/bin/bash

echo "Starting no-lock mouse jiggle script... Press Ctrl+C to stop."

while true; do
  # Get current mouse coordinates
  eval "$(xdotool getmouselocation --shell)"
  
  # Move mouse 1 pixel to the right and back
  xdotool mousemove $((X + 1)) $Y
  sleep 0.1
  xdotool mousemove $X $Y
  
  # Wait 50 seconds before next move
  sleep 50
done

