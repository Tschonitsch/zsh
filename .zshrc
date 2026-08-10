#      ______    _              
#     |___  /   | |             
#        / / ___| |__  _ __ ___ 
#       / / / __| '_ \| '__/ __|
#    _./ /__\__ \ | | | | | (__ 
#   (_)_____/___/_| |_|_|  \___|



typeset -a zsh_modules=(
    env
    cnfh
    superfile
    aliases
    keybinds
    history
    installer
    plugins
    completion
    p10k
)

for module in "${zsh_modules[@]}"; do
    source "$HOME/.config/zsh/${module}.zsh"
done
