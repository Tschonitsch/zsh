#!/bin/bash

scripts=(
  "Repo Install"
  "AUR Install"
  "Remove Package"
  "Manpage Viewer"
  "Wallpaper (swww)"
)

choice=$(printf "%s\n" "${scripts[@]}" | fzf \
  --prompt="Select Tool > " \
  --height=40% \
  --border)

case "$choice" in
  "Repo Install")
    ~/.config/scripts/install.sh
    ;;
  "AUR Install")
    ~/.config/scripts/aur-install.sh
    ;;
  "Remove Package")
    ~/.config/scripts/remove.sh
    ;;
  "Manpage Viewer")
    ~/.config/scripts/man.sh
    ;;
  "Wallpaper (swww)")
    ~/.config/scripts/wallpaper.sh
    ;;
esac