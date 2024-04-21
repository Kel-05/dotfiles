#!/bin/bash

for bins in $(ls ~/.config/hypr/exec-once.d/); do
    ~/.config/hypr/exec-once.d/$bins &
done
