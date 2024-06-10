#!/bin/bash
HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
icon=~/.local/share/icons/Catppuccin-Frappe/status/22/dialog-information.svg
time=3000

if [ "$HYPRGAMEMODE" = 1 ] ; then
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:drop_shadow 0;\
        keyword decoration:blur:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0"
    notify-send -i $icon -a Hyprland -t $time "Hyprland" "Gamemode enabled."
    exit
fi
hyprctl reload
notify-send -i $icon -a Hyprland -t $time "Hyprland" "Gamemode disabled."
