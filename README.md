# Zsh Custom Configuration

This repository contains my personal **Zsh configuration** for Arch Linux. It uses Powerlevel10k, aliases and plugins.

<br>

## 🔹 Features

* **Powerlevel10k**
* **Keybindings:** Ctrl + Arrow keys for moving by words.
* **Environment:** Default editor set to `vim`.
* **Superfile Function:** cd on quit.
* **Command Not Found Handler:** Suggests packages for missing commands.
* **AUR Helper Detection:** Automatically detects `yay` or `paru`.
* **Package Installation Function:** Installs packages from Arch repo or AUR.
* **Aliases:** Quick commands for scripts, programs, system tools, and navigation.
* **Eza (ls) Enhancements:** Improved `ls` with icons, tree view, and grouping.
* **Directory Navigation Shortcuts:** `..`, `...`, `.3`, `.4`, `.5`.
* **Zsh Autosuggestions:** Predictive typing suggestions.
* **History Management:** Large history file, append mode, shared between terminals.
* **Zsh Syntax Highlighting:** Visual feedback for commands.

<br>

## ⚡ Installation

1. Clone the repository or copy the `~/.zshrc` and supporting files.
2. Ensure Powerlevel10k is installed:

```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
```

3. Install Zsh plugins (Autosuggestions & Syntax Highlighting):

```bash
sudo pacman -S zsh-autosuggestions zsh-syntax-highlighting
```

4. Source your `~/.zshrc` or restart the terminal.

<br>

## 🖥 Powerlevel10k

* Instant prompt loaded from cache for faster startup.
* Config file: `~/.p10k.zsh`
* Customize with `p10k configure`.

<br>

## 📦 Aliases & Scripts

* Program shortcuts: `code`, `top`, `sen`, `wifi`, `matrix`, `chess`, etc.
* Script shortcuts: `s`, `aur`, `pac`, `pacrm`, `man`.
* Directory navigation: `..`, `...`, `.3`, `.4`, `.5`.
* Eza for enhanced `ls` commands.

<br>

## 📖 Plugins

* **Zsh Autosuggestions:** Predictive command suggestions.
* **Zsh Syntax Highlighting:** Color-coded command feedback.

<br>

## 📝 History Configuration

* File: `~/.zsh_history`
* Size: 10000 entries
* Options: append, incremental sync, shared across terminals, no duplicates.

---

## 🔗 Resources

* [Powerlevel10k GitHub](https://github.com/romkatv/powerlevel10k)
* [Zsh Autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
* [Zsh Syntax Highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
