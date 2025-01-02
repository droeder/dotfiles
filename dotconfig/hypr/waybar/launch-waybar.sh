

#!/bin/bash
CONFIG_BASE="$HOME/.config/hypr/waybar"
CONFIG_FILES="$CONFIG_BASE/config.jsonc $CONFIG_BASE/style.css"
trap "killall waybar" EXIT
while true; do
    waybar -c $CONFIG_BASE/config.jsonc -s $CONFIG_BASE/style.css&
    inotifywait -e create,modify $CONFIG_FILES
    killall waybar
done
