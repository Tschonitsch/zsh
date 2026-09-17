#      ______    _
#     |___  /   | |
#        / / ___| |__  _ __ ___
#       / / / __| '_ \| '__/ __|
#    _./ /__\__ \ | | | | | (__
#   (_)_____/___/_| |_|_|  \___|

# ---------- ZSH Modules ----------
typeset -a zsh_modules=(
    p10k
    env
    cnfh
    superfile
    aliases
    keybinds
    history
    installer
    plugins
    completion
)
# ---------- ZSH Modules ----------

# ---------- Module Loading ----------
for module in "${zsh_modules[@]}"; do
    source "$HOME/.config/zsh/${module}.zsh"  # Load each ZSH module
done
# ---------- Module Loading ----------
