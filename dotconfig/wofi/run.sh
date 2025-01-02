#!/bin/bash

CONFIG="$HOME/.config/wofi/config"
STYLE="$HOME/.config/wofi/style.css"

# Save the currently focused window ID
#current_window=$(hyprctl activewindow | awk 'NR == 1 {print $2}')
#current_window=$( hyprctl activewindow -j | jq -r '.address')


# Launch Wofi
if [[ ! $(pidof wofi) ]]; then
    wofi --conf "${CONFIG}" --style "${STYLE}"
else
    pkill wofi
fi


# Wait for Wofi to close
#wait

# Restore focus to the previously focused window
hyprctl dispatch focuscurrentorlast

