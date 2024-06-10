#!/bin/bash
dir=~/Pictures/Screenshots/screenshot_$(date +%H.%M.%S_%d-%m-%Y).png
grimblast --notify copysave active $dir
