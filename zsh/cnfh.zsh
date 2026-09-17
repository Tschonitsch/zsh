#     _____  _   _ ______ _   _ 
#    /  __ \| \ | ||  ___| | | |
#    | /  \/|  \| || |_  | |_| |
#    | |    | . ` ||  _| |  _  |
#    | \__/\| |\  || |   | | | |
#     \____/\_| \_/\_|   \_| |_/

# ---------- Command Not Found Handler ----------
function command_not_found_handler {

    # ---------- Colors ----------
    local purple='\e[1;35m'  # Purple text
    local bright='\e[0;1m'   # Bright text
    local green='\e[1;32m'   # Green text
    local reset='\e[0m'      # Reset text formatting
    # ---------- Colors ----------

    # ---------- Error Message ----------
    # Display the missing command
    printf 'zsh: command not found: %s\n' "$1"
    # ---------- Error Message ----------

    # ---------- Package Search ----------
    # Search for the command in Arch packages
    local entries=( ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"} )
    # ---------- Package Search ----------

    # ---------- Package Results ----------
    if (( ${#entries[@]} )); then
        printf "${bright}$1${reset} may be found in the following packages:\n"
        local pkg
        # ---------- Package Entries ----------
        for entry in "${entries[@]}"; do
            local fields=( ${(0)entry} )

            # Display package information only when the package changes
            if [[ "$pkg" != "${fields[2]}" ]]; then
                printf "${purple}%s/${bright}%s ${green}%s${reset}\n" \
                    "${fields[1]}" "${fields[2]}" "${fields[3]}"
            fi
            printf '    /%s\n' "${fields[4]}"  # Display the matching file path
            pkg="${fields[2]}"
        done
        # ---------- Package Entries ----------
    fi
    # ---------- Package Results ----------
    return 127  # Return the standard "command not found" exit code
}
# ---------- Command Not Found Handler ----------
