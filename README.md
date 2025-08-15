# This is a "Neovim Configuration" for beginners
>### This configuration will give you 'integrated terminal' and 'file tree' inside Neovim.
>![Screenshot of Neovim Config](source/image.png)
>
>### --- Keyboard Shortcuts ---
>* `ctrl + T`&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: toggles the file tree view \[ use arrow keys to navigate and <enter> to use \]
>* `ctrl + shift + T` : only shifts your focus toward file tree \[ not the opposite \]
>* `ctrl + alt + C` &nbsp;&nbsp;&nbsp;&nbsp;: Starts the integrated terminal if it doesn't exist
>* `ctrl + shift + F` : Toggles the integrated terminal [ only if the terminal is Started ]
>* `ctrl + <space>` &nbsp;&nbsp;&nbsp;&nbsp;: Turns on command search [ exit that by <esc> ]
---
## If you have Neovim installed on your Linux System
>
>
>### Open any Terminal you have -- and follow this instruction page
>#### [ Run these commands to follow the ordered list's instruction ] 
>
>1. Open .config folder
> ```bash
> cd .config
> ```
>>> [[ click this ]  This is a shortcut if you have git installed on your system !!](source/PAGE2.md)
>2. Open nvim folder
> ```bash
> cd nvim
> ```
>>> 2.2. If nvim directory doesn't exist then create one
> >>```
> >>mkdir nvim
> >>```
>>> 2.3. Now do step "2" again and then try step "3"
>
>3. Open 'init.lua' file [ you can use nvim / vim / nano or anything ]
>* * If you are running from terminal and don't have the file it will automatically open a canvas named 'init.lua' and will apear as a file if you write, save and exit.
>```bash
>nano init.lua
>```
>>> 3.2. If the file doesn't exist and wanna create manually
>>>```bash
>>>touch init.lua
>>>```
>>> 3.3. Now follow step "3" again and then try step "4"
>4. Copy everything from 'init.lua' provided in this github repository
>4.2. paste, save and exit \[ in your init.lua \]
>
# You are all set !!  You can reopen Neovim to see changes :)






a

a

a

# Neovim Dotfiles Installer

This repository provides a Bash script (`installer_nvim_dots.sh`) to automate the installation of Neovim and custom configurations for a beginner-friendly setup with an integrated terminal and file tree. It supports Debian/Ubuntu (`apt`) and Arch-based (`pacman`) systems. All default Neovim keybindings are overridden with custom shortcuts tailored to my workflow, as defined in `init_custom.lua`.

- This is part of my [dotfiles](https://github.com/Miraj13123/dotfiles) repository. You can use the [dotfiles](https://github.com/Miraj13123/dotfiles) repo to automatically download this repo along with other dotfiles repositories like Tmux, Kitty, and Bash.

<p align="center">
  <img src="https://raw.githubusercontent.com/neovim/neovim.github.io/master/logos/neovim-logo-300x87.png" alt="Neovim Dotfiles Badge" width="300"/>
</p>

---

## ✨ Features

- **Automated Installation**: Installs Neovim and sets up a custom configuration for a modern editing experience.
- **Integrated Terminal and File Tree**: Provides a VSCode-like interface with a file tree and embedded terminal.
- **Custom Keybindings**: Overrides default Neovim shortcuts with intuitive mappings (see Keybindings section).
- **Non-Interactive Support**: Suitable for `curl | bash` deployment.
- **Safe File Handling**: Prompts to avoid overwriting existing configuration files.
- **Cross-Distro Compatibility**: Supports Debian/Ubuntu (`apt`) and Arch-based (`pacman`) systems.

## 📋 Prerequisites

- A Debian/Ubuntu or Arch-based Linux system.
- `sudo` permissions for package installation.
- A terminal for interactive execution or a non-interactive environment for `curl | bash`.

### Install Prerequisites
```bash
sudo apt install curl git -y
```

---

## 🛠️ Installation

### Manual Installation
Clone the repository, run the script, and clean up:
```bash
git clone https://github.com/Miraj13123/Neovim.git temp101
cd temp101
chmod +x installer_nvim_dots.sh
./installer_nvim_dots.sh
cd ..
rm -rf temp101
```

### One-Liner Installation
```bash
git clone https://github.com/Miraj13123/Neovim.git temp101 && cd temp101 && chmod +x installer_nvim_dots.sh && ./installer_nvim_dots.sh && cd .. && rm -rf temp101
```

The script will:
1. Detect the package manager (`apt` or `pacman`).
2. Install Neovim if not already present (assumes "yes" in non-interactive mode).
3. Create or update `~/.config/nvim/init.lua` and `init_custom.lua`.
4. Source `init_custom.lua` in `init.lua` for custom configurations.

---

## ⚙️ Neovim Configuration

The `~/.config/nvim/init.lua` and `init_custom.lua` files provide a customized Neovim setup with:
- **Integrated Terminal**: Open and toggle a terminal within Neovim.
- **File Tree**: A navigable file explorer with arrow key support.
- **Custom Keybindings**: Intuitive shortcuts overriding default Neovim bindings (see `init_custom.lua`).
- **Customizable**: Add settings to `init_custom.lua` to extend or override defaults.

To source custom settings in `~/.config/nvim/init.lua`:
```bash
dofile(vim.fn.stdpath('config') .. '/init_custom.lua')
```

---

## ⌨️ Keybindings

This configuration disables default Neovim keybindings and uses custom shortcuts for a beginner-friendly experience. The keybindings below are defined in `init_custom.lua` and do not use a leader key (all are direct key combinations).

| **Category**         | **Keybinding**            | **Action**                              |
|----------------------|---------------------------|-----------------------------------------|
| **File Tree**        | `Ctrl+T`                 | Toggle the file tree view (navigate with arrow keys, `<Enter>` to open) |
|                      | `Ctrl+Shift+T`           | Focus the file tree (no toggle)         |
| -                    | -                        | -                                       |
| **Terminal**         | `Ctrl+Alt+C`             | Start the integrated terminal if not open |
|                      | `Ctrl+Shift+F`           | Toggle the integrated terminal (if started) |
| -                    | -                        | -                                       |
| **Command Search**   | `Ctrl+Space`             | Open command search (exit with `<Esc>`) |

*Note*: Additional keybindings may be defined in `init_custom.lua`. Check the file for the full list.

---

## 📝 Customization

- **Extend Configurations**: Add custom settings to `~/.config/nvim/init_custom.lua` to override or extend defaults without modifying `init.lua`.
- **Plugin Management**: Install plugins by editing `init_custom.lua` (e.g., using `packer.nvim` or `lazy.nvim`) and running the appropriate sync command (e.g., `:PackerSync` or `:Lazy sync`).

---

## 📜 License

This project is licensed under the [Apache 2.0 License](LICENSE).

---

[![Back to Dotfiles](https://img.shields.io/badge/Back_to_Dotfiles-181717?style=flat-square&logo=github)](https://github.com/Miraj13123/dotfiles)
[![Connect on X](https://img.shields.io/badge/Connect_on_X-1DA1F2?style=flat-square&logo=x)](https://x.com/Mahmudul__Miraj)