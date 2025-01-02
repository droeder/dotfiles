

#!/bin/bash
SHUTDOWN_DIR="$HOME/.config/hypr/waybar/custom/shutdown-btn"
CONFIG_FILES="$SHUTDOWN_DIR/style.css $SHUTDOWN_DIR/mocha.css"
OPTIONS="Shutdown\nReboot\nLogout\nCancel"

trap "killall wofi" EXIT
while true; do
    echo -e "$OPTIONS" | wofi --conf $SHUTDOWN_DIR/config.toml --style $SHUTDOWN_DIR/style.css  &
    inotifywait -e create,modify $CONFIG_FILES
    killall wofi
done
