#      ___  _ _
#     / _ \| (_)
#    / /_\ \ |_  __ _ ___  ___  ___
#    |  _  | | |/ _` / __|/ _ \/ __|
#    | | | | | | (_| \__ \  __/\__ \
#    \_| |_/_|_|\__,_|___/\___||___/

# ---------- Core ----------
alias c='clear'   # Quickly clear the terminal
alias :q='exit'   # Exit the current shell
# ---------- Core ----------

# ---------- System ----------
alias ff='fastfetch'            # Display system information
alias sys='systemctl-tui'       # Open the systemctl TUI
alias ssys='sudo systemctl-tui' # Open systemctl-tui with root privileges
alias sspf='sudo spf'           # Open superfile with root privileges
# ---------- System ----------

# ---------- Tools ----------
alias n='nvim'                      # Quickly open Neovim
alias icat='kitten icat'            # Display images directly in the terminal
alias matrix='cmatrix'              # Display a Matrix-style animation
alias cal='calcurse -g && calcurse' # Clean old notes and open Calcurse
alias bonsai='cbonsai -il'          # Continuously generate live bonsai trees
alias clock='tty-clock -sD'         # Display a live digital clock
# ---------- Tools ----------

# ---------- Eza (Better ls) ----------
alias ls='eza -1a --icons=auto'                                        # List all files with icons
alias l='eza -lha --icons=auto'                                        # Detailed list with hidden files
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # Sort by name and group directories first
alias ld='eza -lhDa --icons=auto'                                      # List directories only
alias lt='eza --icons=auto --tree'                                     # Display files as a tree
# ---------- Eza (Better ls) ----------

# ---------- Navigation ----------
alias ..='cd ..'          # Move up one directory
alias .2='cd ../..'       # Move up two directories
alias .3='cd ../../..'    # Move up three directories
alias .4='cd ../../../..' # Move up four directories
# ---------- Navigation ----------

# ---------- Wallpaper / Themes ----------
alias bg='awww img --transition-type none' # Change the wallpaper using awww
alias fg='matugen image'                   # Generate colors from the wallpaper using Matugen
alias rgb='~/.config/OpenRGB/matugen.sh'   # Change RGB lighting using Matugen colors
# ---------- Wallpaper / Themes ----------

# ---------- Tmux ----------
alias t='tmux'                # Open tmux
alias tn='tmux new-session'   # Create a new tmux session
alias ta='tmux attach'        # Attach to a tmux session
alias tl='tmux list-sessions' # List all tmux sessions
alias tk='tmux kill-session'  # Kill a tmux session
alias tka='tmux kill-server'  # Kill the tmux server and all sessions

# Tmux Sessions
alias ts='tmux new-session -A -s' # Create or attach to a named tmux session
alias td='tmux detach'            # Detach from the current tmux session

# Tmux Windows
alias tw='tmux new-window'   # Create a new window in the active session
alias tW='tmux list-windows' # List windows in the active session
# ---------- Tmux ----------
