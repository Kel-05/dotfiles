#!/bin/bash
dir=~/Pictures/Screenshots/screenshot_$(date +%d-%m-%Y_%H.%M.%S).png
grimblast --notify copysave active $dir
