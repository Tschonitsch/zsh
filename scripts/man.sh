#!/bin/bash

fzf_args=(
  --preview 'man {1} 2>/dev/null || echo "No Manpage found"'
  --preview-label='alt-p: toggle preview, alt-j/k: scroll'
  --preview-label-pos='bottom'
  --preview-window 'down:65%:wrap'
  --bind 'alt-p:toggle-preview'
  --bind 'alt-d:preview-half-page-down,alt-u:preview-half-page-up'
  --bind 'alt-k:preview-up,alt-j:preview-down'
  --color 'pointer:green,marker:green'
)

pkg_name=$(pacman -Slq | fzf "${fzf_args[@]}")

if [[ -n "$pkg_name" ]]; then
  man "$pkg_name" 2>/dev/null || echo "No Manpage for $pkg_name found."
fi