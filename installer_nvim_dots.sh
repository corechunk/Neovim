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

str_finder(){              #           (( 1.2 ))
    if grep -q "$2" "$1";then
        return 0
    else
        return 1
    fi
}
recopy(){
    if [[ -f "$2" ]];then
        cp "$1" "$2"
        if [ $? -eq 0 ];then echo "successfully re-copied"; fi
        return 0
    fi
    echo "file doesn't exist"
    return 1
}

#                  ################################## ################################## ##################################
#                  ################################## ========+ MAIN functions +======== ################################## kitty
#                  ################################## ################################## ##################################

#config checker
config_checker(){
    if [ ! -d "$CONFIG_DIR" ];then
        if mkdir -p "$CONFIG_DIR" && echo "$CONFIG_DIR created successfully";then
            return 0
        else
            return 1
        fi
    fi
    echo "$CONFIG_DIR already exists"
    return 0
}

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

# 
ensure_init_lua() {   

    if ! config_checker;then
        echo "unable to create $CONFIG_DIR, quiting ... "
        return 1
    fi

    if [ ! -f "$target_conf" ]; then
        if prompt_user "init.lua not found in $CONFIG_DIR. Create an empty init.lua?"; then
            touch "$target_conf"
            echo "Created empty file $target_conf."
        else
            echo "Cannot proceed without init.lua !"
            return 1
        fi
    fi
    return 0
}

# Function to install init_custom.lua and update init.lua
install_init_custom_lua() {

    if ! config_checker;then
        echo "unable to create $CONFIG_DIR, quiting ... "
        return 1
    fi

    if prompt_user "Install 'init_custom.lua' and source it in 'init.lua'?"; then

        if [ ! -f "$script_custom" ]; then
            echo "Error: init_custom.lua not found in $SCRIPT_DIR dir"
            return 1
        fi

        if [ ! -f "$target_custom" ]; then   ##  !!
            cp "$script_custom" "$target_custom"
            echo "init_custom.lua pasted"
        else
            echo "init_custom.lua already installed in $CONFIG_DIR."
            if prompt_user "wanna re-install?";then
                if cp "$script_custom" "$target_custom";then
                    echo re-pasted
                else
                    return 1
                fi
            else
                echo "skipping without re-pasting 'init_custom.lua'"
            fi
        fi
        
        # Check if init_custom.lua is already included
        if ! grep -q "dofile(vim.fn.stdpath('config') .. '/init_custom.lua')" "$target_conf"; then
            echo "Adding source directive for init_custom.lua to init.lua..."
            echo "dofile(vim.fn.stdpath('config') .. '/init_custom.lua')" >> "$target_conf"
            echo "sourceed 'init_custom.lua' in 'init.lua'."
        else
            echo "'init_custom.lua' is already sourceed in 'init.lua'"
        fi
        return 0
    else
        echo "Skipping 'init_custom.lua' installation."
        return 1
    fi
}


# ==========  ========== Main execution ==========  ========== 
# ==========  ========== Main execution ==========  ========== 

echo "Starting Neovim custom dotfiles installation..."


if ! install_neovim;then
    echo "somehow installation of Neovim from '$(package_manager)' has failed"
fi

if ! ensure_init_lua;then
    echo "'init.lua' file couldn't be created !! sorry, i tried :( "
fi

if ! install_init_custom_lua;then
    echo "somehow installation of 'init_custom.lua' has failed"
fi



echo "Neovim dotfiles installation complete."
exit 0
