#!/bin/bash
zoom_value=$(hyprctl getoption cursor:zoom_factor | grep [0-9] | cut -d" " -f2) 

zoom_value=$(echo "$zoom_value $1 0.2" | bc)
hyprctl keyword cursor:zoom_factor $zoom_value
