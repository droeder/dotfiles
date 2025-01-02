#!/bin/bash

echo "Changing wallpapers now..."
date

while true; do
    directory=/home/droeder/.config/hypr/wallpapers
    monitor=`hyprctl monitors | grep Monitor | awk '{print $2}'`
    echo "using directory $directory"
    if [ -d "$directory" ]; then
        random_background=$(ls $directory/* | shuf -n 1)
        echo $(hyprctl instances)
        hyprctl --instance 0 hyprpaper unload all
        hyprctl --instance 0 hyprpaper preload $random_background
        hyprctl --instance 0 hyprpaper wallpaper "$monitor, $random_background"

        #hyprctl --instance 0 dispatch exec hyprpaper unload all
        #hyprctl --instance 0 hyprpaper preload $random_background
        #hyprctl --instance 0 dispatch exec <your command>
        #hyprctl --instance 0 dispatch exec <your command>

        echo "Changing wallpaper to $random_background"
    fi
    sleep 180
done
