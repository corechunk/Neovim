# Neovim Dotfiles Installer (LazyVim)

This repository provides a Bash script (`installer_nvim_dots.sh`) to automate the installation of Neovim and the [LazyVim starter configuration](https://github.com/LazyVim/starter) for a powerful, beginner-friendly setup with a file finder, command palette, and modern plugins. It supports Debian/Ubuntu (`apt`) and Arch-based (`pacman`) systems.

- This is part of my [dotfiles](https://github.com/Miraj13123/dotfiles) repository. You can use the [dotfiles](https://github.com/Miraj13123/dotfiles) repo to automatically download this repo along with other dotfiles repositories like Tmux, Kitty, and Bash.
- If you wanna checkout my own custom conficuration with "Packer" Plugin Manager then Check out the [main branch](https://github.com/Miraj13123/Neovim/tree/main) for a tailored setup.

<p align="center">
  <img src="https://img.shields.io/badge/Neovim-LazyVim-181717?style=flat-square&logo=neovim" alt="Neovim LazyVim Badge" width="300"/>
</p>
<p align="center">
  <img src="https://user-images.githubusercontent.com/292349/213447056-92290767-ea16-430c-8727-ce994c93e9cc.png" alt="Neovim Dotfiles Badge" width="800"/>
</p>

---

## ✨ Features

- **Automated Installation**: Installs Neovim and the LazyVim starter configuration with minimal setup.
- **Cross-Distro Compatibility**: Supports Debian/Ubuntu (`apt`) and Arch-based (`pacman`) systems.
- **Modern Plugin Ecosystem**: Includes plugins for code completion, file navigation, and a polished UI via LazyVim.
- **Safe Installation**: Warns before overwriting existing `~/.config/nvim` directory.

## 📋 Prerequisites

- A Debian/Ubuntu or Arch-based Linux system.
- `sudo` permissions for package installation.
- `git` for cloning the LazyVim configuration.

### Install Prerequisites
```bash
sudo apt install curl git -y
```

---

## 🛠️ Installation

**Warning**: The script will delete your existing `~/.config/nvim` directory to install LazyVim. Back up any custom configurations in `~/.config/nvim` before proceeding.

### Start Installation
Run this command to start the program to run directly and cleanup automatically 
```bash
git clone https://github.com/Miraj13123/Neovim.git -b lazyvim temp101
cd temp101
chmod +x installer_nvim_dots.sh
./installer_nvim_dots.sh
cd ..
rm -rf temp101
```
**Note:** Clone the repository, run the script, and clean up **`[note about what the command does]`**

>## One-Liner to start Installation
>```bash
>git clone https://github.com/Miraj13123/Neovim.git -b lazyvim temp101 && cd temp101 && chmod +x installer_nvim_dots.sh && ./installer_nvim_dots.sh && cd .. && rm -rf temp101
>```

### If you wanna checkout the repository yourself `[OPTIONAL]`
- Go to any folder where you feel okey to clone another repositoy
- give permission to the script and run it
- you can check the repo and read your self or read from the github page 
```bash
git clone https://github.com/Miraj13123/Neovim.git -b lazyvim
```


The script will:
1. Detect the package manager (`apt` or `pacman`).
2. Install Neovim if not already present (prompts for confirmation in interactive mode).
3. Remove `~/.config/nvim` (with confirmation) and clone the LazyVim starter configuration.
4. Remove the `.git` directory to create a clean setup.

---

## ⚙️ Neovim Configuration

The LazyVim starter configuration is installed in `~/.config/nvim`, providing:
- **File Finder**: Search files with Telescope (default: `<leader>ff`).
- **Command Palette**: Access commands via Telescope (default: `<leader>` is space).
- **Plugin Management**: Uses `lazy.nvim` for easy plugin installation and updates.
- **Customizable**: Edit `~/.config/nvim/lua/config/` to tweak settings or add plugins.

To sync plugins after editing:
```bash
nvim
:Lazy sync
```

---

## ⌨️ Keybindings

LazyVim uses a **leader key** set to `<Space>` by default. After opening Neovim by running `nvim` in a terminal, press `<Space>` like any other key to see a popup menu of available shortcuts followed by `<leader>` (powered by WhichKey). This makes it easy to discover commands without memorizing them.

New to Vim? Learn about its default motions (e.g., `h`, `j`, `k`, `l` for navigation) and modes (Normal, Insert, Visual) in [Vim Motions and Modes](https://github.com/Miraj13123/extras/blob/main/files/vim/vim_motions_modes.md) to get started.

Below are the most important shortcuts to know as a beginner. These work in **Normal mode** (press `<Esc>` to enter Normal mode).

| **Category**         | **Keybinding**            | **Action**                              |
|----------------------|---------------------------|-----------------------------------------|
| **File Explorer**    | `<leader>e` (Space e)     | Open file tree on the side (navigate with arrow keys) |
| **Command Palette**  | `<leader>:` (Space :)     | Open Telescope for commands and searches |
| **File Search**      | `<leader><leader>` or `<leader>ff` (Space Space or Space ff) | Search files in the root directory |
| **Quit**             | `q`                       | Quit menus, popups, or the command palette |

*Note*: LazyVim has many more shortcuts. Press `<Space>` to explore the popup menu, or check `~/.config/nvim/lua/config/keymaps.lua` for the full list.

---

## 📝 Customization

- **Edit Settings**: Modify `~/.config/nvim/lua/config/options.lua` for general settings or `keymaps.lua` for custom keybindings.
- **Add Plugins**: Add plugins to `~/.config/nvim/lua/plugins/` and run the following to install them:
```bash
nvim
:Lazy sync
```
- **Learn More**: Visit [Vim Motions and Modes](https://github.com/Miraj13123/extras/blob/main/files/vim/vim_motions_modes.md) for navigation tips, or explore the [LazyVim documentation](https://www.lazyvim.org) for advanced customization.

---

## 📜 License

This project is licensed under the [Apache 2.0 License](LICENSE).

---

[![Back to Dotfiles](https://img.shields.io/badge/Back_to_Dotfiles-181717?style=flat-square&logo=github)](https://github.com/Miraj13123/dotfiles)
[![Connect on X](https://img.shields.io/badge/Connect_on_X-1DA1F2?style=flat-square&logo=x)](https://x.com/Mahmudul__Miraj)
