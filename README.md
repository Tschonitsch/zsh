# Zshrc config

## Example

```zshrc
╔══════════════════════════════════════╗
║          AUR HELPER DETECTION        ║
╚══════════════════════════════════════╝
if pacman -Qi yay &>/dev/null; then
   aurhelper="yay"
elif pacman -Qi paru &>/dev/null; then
   aurhelper="paru"
fi

╔══════════════════════════════════════╗
║        PACKAGE INSTALL FUNCTION      ║
╚══════════════════════════════════════╝
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
```
 This allows you to install packages with:  **in + package name**. It will chose between pacman or aur helper like yay or paru.
