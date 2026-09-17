#     _   _ _     _
#    | | | (_)   | |
#    | |_| |_ ___| |_ ___  _ __ _   _
#    |  _  | / __| __/ _ \| '__| | | |
#    | | | | \__ \ || (_) | |  | |_| |
#    \_| |_/_|___/\__\___/|_|   \__, |
#                                __/ |
#                               |___/

# ---------- Savefile ----------
HISTFILE=~/.config/zsh/.history
# ---------- Savefile ----------

# ---------- History Size ----------
HISTSIZE=10000
SAVEHIST=10000
# ---------- History Size ----------

# ---------- History Options ----------
setopt APPEND_HISTORY       # Append new commands instead of overwriting the history file
setopt INC_APPEND_HISTORY   # Immediately save each command to the history file
setopt SHARE_HISTORY        # Share history between multiple terminal sessions
setopt HIST_IGNORE_DUPS     # Ignore duplicate commands when searching through history
setopt HIST_IGNORE_ALL_DUPS # Remove all duplicate entries from the history
setopt HIST_FIND_NO_DUPS    # Prevent duplicate commands from appearing in history search results
# ---------- History Options ----------
