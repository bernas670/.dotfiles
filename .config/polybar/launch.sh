#!/usr/bin/env bash

polybar-msg cmd quit

# echo "---" | tee -a /tmp/polybar.log
# polybar example 2>&1 | tee -a /tmp/polybar.log & disown
# echo "Polybar launched..."

for m in $(polybar --list-monitors | cut -d":" -f1); do
    MONITOR=$m polybar example -c $HOME/.config/polybar/config.ini &
done 
