#!/bin/bash

# In den Wallpaper-Ordner wechseln
cd ~/Pictures/Wallpaper || exit

# Bild mit fzf auswählen
file=$(ls | fzf --prompt="Select wallpaper: ")

# Wenn ein Bild ausgewählt wurde, als Wallpaper setzen
if [[ -n "$file" ]]; then
    # Wallpaper ohne Fade setzen
    swww img "$file" --transition-type none
fi