#!/bin/bash
time=3000
icon=info

if pidof hypridle > /dev/null; then
    pkill hypridle
    notify-send -i $icon -a Hyprland -t $time "Hyprland" "Idle inhibitor enabled"
else
    hypridle &
    notify-send -i $icon -a Hyprland -t $time "Hyprland" "Idle inhibitor disabled"
fi
