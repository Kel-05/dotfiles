#!/bin/bash
if pidof emacs; then
  	exit 1
fi
icon=~/.config/hypr/assets/emacs.svg
error=~/.config/hypr/assets/error.svg
    
notify-send -i $icon -a Emacs "Emacs" "Starting Emacs daemon..."
emacs --daemon

if [ $? -eq 0 ]; then
	notify-send -i $icon -a Emacs "Emacs" "Emacs daemon started successfully!"
else
	notify-send -i $error -a Emacs "Error: Emacs" "An error occured while starting Emacs."
fi
