
fastfetch

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


# -----------------
# Ctrl + Arrow keys
# left/right
# -----------------
bindkey '^[[1;5C' forward-word   # Ctrl + rechts
bindkey '^[[1;5D' backward-word  # Ctrl + links


# -----------------
# Editor to open files with
# needed for yazi file explorer
# -----------------
export EDITOR='code'


# -----------------
# Copy path file from yazi to terminal
# -----------------
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}


# -----------------
# In case a command is not found, 
# try to find the package that has it
# -----------------
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


# -----------------
# Detect AUR wrapper
# -----------------
if pacman -Qi yay &>/dev/null; then
   aurhelper="yay"
elif pacman -Qi paru &>/dev/null; then
   aurhelper="paru"
fi


# -----------------
# Install arch / aur / pgk
# with: in [name]
# -----------------
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


# -----------------
#	  Alias
# -----------------

# Helpful aliases
alias c='clear' # clear terminal
alias ff='fastfetch'
alias clock='tty-clock -sD'
alias top='btop'
alias tree='cbonsai -il'
alias matrix='cmatrix'
alias night='gammastep -O 2000'

alias steam='steam & disown'

# eza
alias l='eza -lha --icons=auto' # long list
alias ls='eza -1a --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhDa --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree

# Aur Helper
#alias un='$aurhelper -Rns' # uninstall package
#alias up='$aurhelper -Syu' # update system/package/aur
#alias pl='$aurhelper -Qs' # list installed package
#alias pa='$aurhelper -Ss' # list available package
#alias pc='$aurhelper -Sc' # remove unused cache
#alias po='$aurhelper -Qtdq | $aurhelper -Rns -' # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -

# Directory navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'


#Spicetiy
export PATH=$PATH:~/.spicetify


