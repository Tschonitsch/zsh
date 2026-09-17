#     _____                        __ _ _      
#    /  ___|                      / _(_) |     
#    \ `--. _   _ _ __   ___ _ __| |_ _| | ___ 
#     `--. \ | | | '_ \ / _ \ '__|  _| | |/ _ \
#    /\__/ / |_| | |_) |  __/ |  | | | | |  __/
#    \____/ \__,_| .__/ \___|_|  |_| |_|_|\___|
#                | |                           
#                |_|                           

# ---------- Superfile ----------
function spf {

    # ---------- Operating System ----------
    os=$(uname -s)  # Detect the current operating system
    # ---------- Operating System ----------

    # ---------- Linux Configuration ----------
    if [[ "$os" == "Linux" ]]; then
        export SPF_LAST_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/superfile/lastdir"  # Store the last visited directory
    fi
    # ---------- Linux Configuration ----------

    # ---------- Superfile ----------
    command spf "$@"  # Run the original superfile command
    # ---------- Superfile ----------

    # ---------- Last Directory ----------
    [ ! -f "$SPF_LAST_DIR" ] || {
        . "$SPF_LAST_DIR"  # Restore the last visited directory
        rm -f -- "$SPF_LAST_DIR" > /dev/null  # Remove the temporary state file
    }
    # ---------- Last Directory ----------
}
# ---------- Superfile ----------
