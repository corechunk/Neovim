#!/bin/bash

# Determine the source directory based on execution context
if [ -d "nvim" ]; then
    # Called from root of repo
    SCRIPT_DIR="nvim"
else
    # Called from within neovim folder
    SCRIPT_DIR="."
fi

# User configuration directory
CONFIG_DIR="$HOME/.config/nvim"

script_custom="$SCRIPT_DIR/init_custom.lua"
target_custom="$CONFIG_DIR/init_custom.lua"
target_conf="$CONFIG_DIR/init.lua"

# Function to prompt user for y/n input
prompt_user() {
    local message=$1
    local response

    for(( i=0;i<2;i++ ));do
        read -p "$message [y/n]: " response
        if [[ "$response" == "y" || "$response" == "Y" ]];then
            return 0
        elif [[ "$response" == "n" || "$response" == "N" ]];then
            return 1
        fi
    done
    return 1
}


# Function to check if a command is available
command_exists() {
    command -v "$1" >/dev/null 2>&1
    #echo $?
    return $?
}

# Function to detect package manager
package_manager() {
    if command_exists apt; then
        echo "apt"
    elif command_exists pacman; then
        echo "pacman"
    else
        echo "none"
    fi
}

#                  ################################## ################################## ##################################
#                  ################################## ========+ MAIN functions +======== ################################## kitty
#                  ################################## ################################## ##################################


# Function to install neovim
install_neovim() {  ##################
    echo "Checking if neovim is installed..."
    if command_exists nvim; then
        echo "Neovim is already installed."
        return 0
    fi
    
    if prompt_user "neovim is not installed. Would you like to install it?"; then
        if [ "$(package_manager)" = "apt" ]; then
            echo "Installing neovim using apt..."
            sudo apt update
            sudo apt install -y neovim
        elif [ "$(package_manager)" = "pacman" ]; then
            echo "Installing neovim using pacman..."
            sudo pacman -Syu --noconfirm neovim
        else
            echo "Error: No supported package manager (apt or pacman) found."
            return 1
        fi
        
        if command_exists nvim; then
            echo "neovim installed successfully."
            return 0
        else
            echo "Error: neovim installation failed."
            return 1
        fi
        return 0
    else
        echo "Skipping neovim installation."
        return 1
    fi
}



# ==========  ========== Main execution ==========  ========== 
# ==========  ========== Main execution ==========  ========== 

echo "Starting Neovim custom dotfiles installation..."


if ! install_neovim;then
    echo "somehow installation of Neovim from '$(package_manager)' has failed"
fi

echo "Do you want to install Lazyvim configuration ?"
echo "--> this will delete your existing neovim configuration in your '$HOME/.config/nvim' directory !!    <<  <<  <<  <<  <<  <<  <<"
if prompt_user "Do you want to install ?";then
    echo "installing lazyvim ..."
    rm -rf ~/.config/nvim
    mkdir -p "$HOME/.config/nvim"
    git clone https://github.com/LazyVim/starter ~/.config/nvim
    rm -rf ~/.config/nvim/.git
    return 0
else
    echo "aborting installation of lazyvim"
    return 1
fi

echo "Neovim dotfiles installation complete."
exit 0
