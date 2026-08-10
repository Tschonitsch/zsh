
#╔══════════════════════════════════════╗
#║              ZSH HISTORY             ║
#╚══════════════════════════════════════╝
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


