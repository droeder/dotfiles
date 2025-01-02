#!/bin/bash

# Options
OPTIONS="Shutdown\nReboot\nLock\nLogout\nCancel"
SHUTDOWN_DIR="$HOME/.config/hypr/waybar/custom/shutdown-btn"
# Show menw
# CHOICE=$(echo -e "$OPTIONS" | wofi -dmenu -p "Shutdown Menu" --insensitive )
CHOICE=$(echo -e "$OPTIONS" | wofi --conf $SHUTDOWN_DIR/config.toml --style $SHUTDOWN_DIR/style.css)
echo "You chose: $CHOICE"

case "$CHOICE" in
    Shutdown)
        echo "Shutting down..."
        systemctl poweroff
        ;;
    Reboot)
        echo "Rebooting..."
        systemctl reboot
        ;;
    Lock)
        echo "Locking screen out..."
        swaylock --ignore-empty-password --show-failed-attempts --color 1e1e1e
        ;;
    Logout)
        echo "Logging out..."
        hyprctl dispatch exit 1
        ;;
    Cancel)
        exit 0
        ;;
esac
