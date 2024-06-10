#!/bin/bash
time=3000
icon=~/.local/share/icons/Catppuccin-Frappe/status/22/dialog-information.svg

if grep 1 <<< "$(hyprctl getoption input:touchpad:disable_while_typing)"; then
    hyprctl keyword input:touchpad:disable_while_typing false
    notify-send -i $icon -a Hyprland -t $time "Hyprland" "Touchpad will stay active when typing."
else
    hyprctl keyword input:touchpad:disable_while_typing true
    notify-send -i $icon -a Hyprland -t $time "Hyprland" "Touchpad will be disabled when typing."
fi
