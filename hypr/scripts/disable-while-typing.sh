#!/bin/bash
time=3000
icon=~/.config/hypr/assets/info

if hyprctl getoption input:touchpad:disable_while_typing | grep 1; then
    hyprctl keyword input:touchpad:disable_while_typing false
    hyprctl keyword cursor:hide_on_key_press false
    notify-send -i $icon -a Hyprland -t $time "Hyprland" "Touchpad will stay active when typing."
else
    hyprctl keyword input:touchpad:disable_while_typing true
    hyprctl keyword cursor:hide_on_key_press true
    notify-send -i $icon -a Hyprland -t $time "Hyprland" "Touchpad will be disabled when typing."
fi
