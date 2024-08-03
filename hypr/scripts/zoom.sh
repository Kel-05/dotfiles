#!/bin/bash

if hyprctl getoption cursor:zoom_factor | grep 1; then
    hyprctl keyword cursor:zoom_factor 3
else
    hyprctl keyword cursor:zoom_factor 1
fi
