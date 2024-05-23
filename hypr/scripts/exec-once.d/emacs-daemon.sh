#!/bin/bash
icon=~/.local/share/icons/Tela-circle-blue-dark/scalable/apps/emacs.svg
error=~/.local/share/icons/Catppuccin-Frappe/status/22/dialog-error.svg

notify-send -i $icon -a Emacs "Emacs" "Starting Emacs daemon..."
emacs --daemon
if [ $? -eq 0 ]; then
    notify-send -i $icon -a Emacs "Emacs" "Emacs daemon started successfully!"
else
    notify-send -i $error -a Emacs "Error: Emacs" "An error happened while starting Emacs."
fi
