#!/bin/bash
time=3000
icon=~/.local/share/icons/Catppuccin-Frappe/status/22/dialog-information.svg

if grep dwindle <<< "$(hyprctl getoption general:layout)"; then
    hyprctl keyword general:layout master
    notify-send -i $icon -t $time "Hyprctl layout" "Layout set to master"
else
    hyprctl keyword general:layout dwindle
    notify-send -i $icon -t $time "Hyprctl layout" "Layout set to dwindle"
