#!/bin/bash
time=3000
icon=~/.config/hypr/assets/info

if hyprctl getoption general:layout | grep dwindle; then
    hyprctl keyword general:layout master
    notify-send -i $icon -a Hyprland -t $time "Hyprland" "Layout set to master"
else
    hyprctl keyword general:layout dwindle
    notify-send -i $icon -a Hyprland -t $time "Hyprland" "Layout set to dwindle"
fi
