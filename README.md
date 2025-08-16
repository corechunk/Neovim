# Neovim Dotfiles Installer

This repository provides a Bash script (`installer_nvim_dots.sh`) to automate the installation of Neovim and custom configurations for a beginner-friendly setup with an integrated terminal and file tree. It supports Debian/Ubuntu (`apt`) and Arch-based (`pacman`) systems. All default Neovim keybindings are overridden with custom shortcuts tailored to my workflow, as defined in `init_custom.lua`.

- This is part of my [dotfiles](https://github.com/Miraj13123/dotfiles) repository. You can use the [dotfiles](https://github.com/Miraj13123/dotfiles) repo to automatically download this repo along with other dotfiles repositories like Tmux, Kitty, and Bash.
- You can checkout the other repositoy which will install `lazyvim` configuration for your `neovim`.

<!-- 
<p align="center">
  <img src="https://raw.githubusercontent.com/neovim/neovim.github.io/master/logos/neovim-logo-300x87.png" alt="Neovim Dotfiles Badge" width="300"/>
</p>
-->
<p align="center">
  <img src="https://img.shields.io/badge/Neovim-Dotfiles-181717?style=flat-square&logo=neovim" alt="Neovim Dotfiles Badge" width="300"/>
</p>

---

>![Screenshot of Neovim Config](source/image.png)
## ✨ Features

- **Automated Installation**: Installs Neovim and sets up a custom configuration for a modern editing experience.
- **Integrated Terminal and File Tree**: Provides a VSCode-like interface with a file tree and embedded terminal.
- **Custom Keybindings**: Overrides default Neovim shortcuts with intuitive mappings (see Keybindings section).
- **Safe File Handling**: Prompts to avoid overwriting existing configuration files.
- **Cross-Distro Compatibility**: Supports Debian/Ubuntu (`apt`) and Arch-based (`pacman`) systems.

## 📋 Prerequisites

- A Debian/Ubuntu or Arch-based Linux system.
- `sudo` permissions for package installation.

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

This configuration disables default Neovim keybindings and uses simple, direct shortcuts for a beginner-friendly experience, without requiring a leader key (unlike traditional Vim setups). The **command palette** (`Ctrl+Space`) opens a searchable menu where you can type Neovim commands (e.g., `w` to save) and press `<Enter>` to execute or `<Esc>` to exit, similar to VSCode’s command palette.

New to Vim? Learn about its default motions (e.g., `h`, `j`, `k`, `l` for navigation) and modes (Normal, Insert, Visual) in [Vim Motions and Modes](docs/vim_motions_modes.md) to understand the basics.

- These keybinds will only work in normal mode 
  - (not in insert mode)

| **Category**         | **Keybinding**            | **Action**                              |
|----------------------|---------------------------|-----------------------------------------|
| **File Tree**        | `Ctrl+T`                 | Toggle the file tree view (navigate with arrow keys, `<Enter>` to open) |
|                      | `Ctrl+Shift+T`           | Focus the file tree (no toggle)         |
| -                    | -                        | -                                       |
| **Terminal**         | `Ctrl+Alt+C`             | Start the integrated terminal if not open |
|                      | `Ctrl+Shift+F`           | Toggle the integrated terminal (if started) |
| -                    | -                        | -                                       |
| **Command Palette**  | `Ctrl+Space`             | Open command palette (type command, `<Enter>` to execute, `<Esc>` to exit) |

*Note*: Additional keybindings may be defined in `init_custom.lua`. Check the file for the full list.

---

## 📝 Customization

- **Extend Configurations**: Add custom settings to `~/.config/nvim/init_custom.lua` to personalize Neovim without editing `init.lua`. For example, modify keybindings or add plugins.
- **Plugin Management**: Install plugins in `init_custom.lua` using a plugin manager like `packer.nvim` or `lazy.nvim`. Run `:PackerSync` or `:Lazy sync` in Neovim to install or update plugins.
- **Learn More**: Visit [Vim Motions and Modes](docs/vim_motions_modes.md) to learn efficient navigation and editing techniques for Neovim.

---

## 📜 License

This project is licensed under the [Apache 2.0 License](LICENSE).

---

[![Back to Dotfiles](https://img.shields.io/badge/Back_to_Dotfiles-181717?style=flat-square&logo=github)](https://github.com/Miraj13123/dotfiles)
[![Connect on X](https://img.shields.io/badge/Connect_on_X-1DA1F2?style=flat-square&logo=x)](https://x.com/Mahmudul__Miraj)