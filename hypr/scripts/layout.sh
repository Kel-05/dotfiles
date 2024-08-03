#!/bin/bash
time=3000
icon=~/.local/share/icons/Catppuccin-Frappe/status/22/dialog-information.svg

if hyprctl getoption general:layout | grep dwindle; then
    hyprctl keyword general:layout master
    notify-send -i $icon -a Hyprland -t $time "Hyprland" "Layout set to master"
else
    hyprctl keyword general:layout dwindle
    notify-send -i $icon -a Hyprland -t $time "Hyprland" "Layout set to dwindle"
fi
