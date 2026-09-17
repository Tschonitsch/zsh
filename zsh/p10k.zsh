#    ______                      _                _  __  _____ _    
#    | ___ \                    | |              | |/  ||  _  | |   
#    | |_/ /____      _____ _ __| | _____   _____| |`| || |/' | | __
#    |  __/ _ \ \ /\ / / _ \ '__| |/ _ \ \ / / _ \ | | ||  /| | |/ /
#    | | | (_) \ V  V /  __/ |  | |  __/\ V /  __/ |_| |\ |_/ /   < 
#    \_|  \___/ \_/\_/ \___|_|  |_|\___| \_/ \___|_|\___/\___/|_|\_\

# ---------- Powerlevel10k ----------
# Enable Powerlevel10k instant prompt
# Keep this block close to the top of ~/.zshrc
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export PATH="$HOME/.local/bin:$PATH"  # Add local binaries to PATH
source ~/.config/powerlevel10k/powerlevel10k.zsh-theme  # Load Powerlevel10k theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh  # Load Powerlevel10k configuration
# ---------- Powerlevel10k ----------

# ---------- Instant Prompt ----------
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet  # Disable instant prompt warnings
# ---------- Instant Prompt ----------

# ---------- Gitstatus ----------
# Permanently disable gitstatusd
# This must be set after sourcing ~/.p10k.zsh
typeset -g POWERLEVEL9K_DISABLE_GITSTATUS=true

# Prevent gitstatusd from being automatically downloaded or installed
export GITSTATUS_AUTO_INSTALL=0
# ---------- Gitstatus ----------

# ---------- Gitstatus Protection ----------
# Re-enable the gitstatus disabled setting before every prompt
# This prevents `p10k configure` from enabling gitstatusd again
function _p9k_keep_gitstatus_disabled() {
    [[ -n $POWERLEVEL9K_DISABLE_GITSTATUS ]] || typeset -g POWERLEVEL9K_DISABLE_GITSTATUS=true
}

precmd_functions=(_p9k_keep_gitstatus_disabled ${precmd_functions[@]})
# ---------- Gitstatus Protection ----------
