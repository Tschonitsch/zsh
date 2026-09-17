#     _____          _        _ _           
#    |_   _|        | |      | | |          
#      | | _ __  ___| |_ __ _| | | ___ _ __ 
#      | || '_ \/ __| __/ _` | | |/ _ \ '__|
#     _| || | | \__ \ || (_| | | |  __/ |   
#     \___/_| |_|___/\__\__,_|_|_|\___|_|   

# ---------- AUR Helper Detection ----------
if pacman -Qi yay &>/dev/null; then
    aurhelper="yay"  # Use yay if it is installed
elif pacman -Qi paru &>/dev/null; then
    aurhelper="paru"  # Use paru if yay is not installed
fi
# ---------- AUR Helper Detection ----------

# ---------- Package Install Function ----------
# Usage: in [package name]
function in {

    # ---------- Package Arrays ----------
    local -a inPkg=("$@")  # Store all provided package names
    local -a arch=()       # Official repository packages
    local -a aur=()        # AUR packages
    # ---------- Package Arrays ----------

    # ---------- Package Detection ----------
    for pkg in "${inPkg[@]}"; do
        # Check if the package exists in the official repositories
        if pacman -Si "${pkg}" &>/dev/null; then
            arch+=("${pkg}")  # Add official repository package
        else
            aur+=("${pkg}")   # Add AUR package
        fi
    done
    # ---------- Package Detection ----------

    # ---------- Installation ----------
    # pacman
    if [[ ${#arch[@]} -gt 0 ]]; then
        sudo pacman -S "${arch[@]}"  # Install official packages
    fi

    # aur 
    if [[ ${#aur[@]} -gt 0 ]]; then
        ${aurhelper} -S "${aur[@]}"  # Install AUR packages
    fi
    # ---------- Installation ----------
}
# ---------- Package Install Function ----------
