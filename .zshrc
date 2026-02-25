#      ______    _              
#     |___  /   | |             
#        / / ___| |__  _ __ ___ 
#       / / / __| '_ \| '__/ __|
#    _./ /__\__ \ | | | | | (__ 
#   (_)_____/___/_| |_|_|  \___|




#╔══════════════════════════════════════╗
#║            POWERLEVEL10K             ║
#╚══════════════════════════════════════╝
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# Created by newuser for 5.9
source ~/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


#╔══════════════════════════════════════╗
#║             KEYBINDINGS              ║
#╚══════════════════════════════════════╝
# Ctrl + Pfeiltasten
bindkey '^[[1;5C' forward-word   # Ctrl + right
bindkey '^[[1;5D' backward-word  # Ctrl + left


#╔══════════════════════════════════════╗
#║            ENVIRONMENT               ║
#╚══════════════════════════════════════╝
export EDITOR='vim'


#╔══════════════════════════════════════╗
#║              SUPERFILE               ║
#╚══════════════════════════════════════╝
spf() {
    os=$(uname -s)

    # Linux
    if [[ "$os" == "Linux" ]]; then
        export SPF_LAST_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/superfile/lastdir"
    fi

    command spf "$@"

    [ ! -f "$SPF_LAST_DIR" ] || {
        . "$SPF_LAST_DIR"
        rm -f -- "$SPF_LAST_DIR" > /dev/null
    }
}


#╔══════════════════════════════════════╗
#║       COMMAND NOT FOUND HANDLER      ║
#╚══════════════════════════════════════╝
function command_not_found_handler {
    local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
    printf 'zsh: command not found: %s\n' "$1"
    local entries=( ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"} )
    if (( ${#entries[@]} )) ; then
        printf "${bright}$1${reset} may be found in the following packages:\n"
        local pkg
        for entry in "${entries[@]}" ; do
            local fields=( ${(0)entry} )
            if [[ "$pkg" != "${fields[2]}" ]]; then
                printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
            fi
            printf '    /%s\n' "${fields[4]}"
            pkg="${fields[2]}"
        done
    fi
    return 127
}


#╔══════════════════════════════════════╗
#║          AUR HELPER DETECTION        ║
#╚══════════════════════════════════════╝
if pacman -Qi yay &>/dev/null; then
   aurhelper="yay"
elif pacman -Qi paru &>/dev/null; then
   aurhelper="paru"
fi


#╔══════════════════════════════════════╗
#║        PACKAGE INSTALL FUNCTION      ║
#╚══════════════════════════════════════╝
# use: in [package name]
function in {
    local -a inPkg=("$@")
    local -a arch=()
    local -a aur=()

    for pkg in "${inPkg[@]}"; do
        if pacman -Si "${pkg}" &>/dev/null; then
            arch+=("${pkg}")
        else
            aur+=("${pkg}")
        fi
    done

    if [[ ${#arch[@]} -gt 0 ]]; then
        sudo pacman -S "${arch[@]}"
    fi

    if [[ ${#aur[@]} -gt 0 ]]; then
        ${aurhelper} -S "${aur[@]}"
    fi
}


#╔══════════════════════════════════════╗
#║               ALIASES                ║
#╚══════════════════════════════════════╝

alias fan='sudo modprobe -r thinkpad_acpi && sudo modprobe thinkpad_acpi'
alias fanspeed='cat /proc/acpi/ibm/fan'

alias fan1='echo level 1 | sudo tee /proc/acpi/ibm/fan'
alias fan2='echo level 2 | sudo tee /proc/acpi/ibm/fan'
alias fan3='echo level 3 | sudo tee /proc/acpi/ibm/fan'
alias fan4='echo level 4 | sudo tee /proc/acpi/ibm/fan'
alias fan5='echo level 5 | sudo tee /proc/acpi/ibm/fan'
alias fan6='echo level 6 | sudo tee /proc/acpi/ibm/fan'
alias fan7='echo level 7 | sudo tee /proc/acpi/ibm/fan'
alias fanauto='echo level auto | sudo tee /proc/acpi/ibm/fan'
alias fanmax='echo level full-speed | sudo tee /proc/acpi/ibm/fan'

alias aur='~/aur-install.sh'
alias pac='~/install.sh'
alias pacrm='~/remove.sh'
alias wifi='impala'


alias c='clear'
#alias ani='cd ~/Videos/Anime && ani-cli --dub --rofi --download'
alias ani='cd ~/Videos/Anime && ani-cli --dub --rofi'
alias ff='fastfetch'
alias clock='tty-clock -sD'
alias top='btop'
alias tree='cbonsai -il'
alias matrix='cmatrix'
alias on='bash -c "echo 1 | sudo tee /sys/class/leds/tpacpi::kbd_backlight/brightness; echo 1 | sudo tee /sys/class/leds/tpacpi::power/brightness"'
alias off='bash -c "echo 0 | sudo tee /sys/class/leds/tpacpi::kbd_backlight/brightness; echo 0 | sudo tee /sys/class/leds/tpacpi::power/brightness; brightnessctl set 1"'
alias lock='hyprlock'
alias wetter='curl wttr.in/nameOfYourLocation'
alias code='codium'
alias open='opencode'


#╔══════════════════════════════════════╗
#║             EZA (LS)                 ║
#╚══════════════════════════════════════╝
alias l='eza -lha --icons=auto' # long list
alias ls='eza -1a --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhDa --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree


#╔══════════════════════════════════════╗
#║       DIRECTORY NAVIGATION           ║
#╚══════════════════════════════════════╝
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'


#╔══════════════════════════════════════╗
#║          ZSH AUTOSUGGESTIONS         ║
#╚══════════════════════════════════════╝
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# savefile location
HISTFILE=~/.zsh_history
# max number of entrys
HISTSIZE=10000
SAVEHIST=10000
# Anhängen statt überschreiben
setopt APPEND_HISTORY
# Sofortige Synchronisierung zwischen Terminals
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
# Lösche keine leeren Eingaben aus der History
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS


#╔══════════════════════════════════════╗
#║         ZSH SYNTAX HIGHLIGHT         ║
#╚══════════════════════════════════════╝
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
