#!/bin/bash
#
# Father of simple-neovim
#
# Remote installer and adminitrator of Simple Nvim
#
# version 0.5
#

REPOSITORY_URL="https://github.com/thelibertti/simple-Nvim"
repository_name="simple-Nvim"
path="$HOME/.config/"
green="\033[0;32m"
red="\033[0;31m"
yellow="\033[0;33m"
reset="\033[0m"

function print_message() {
    local color=$1
    local message=$2
    echo -e "${color}${message}${reset}"
}

function update_simple_nvim() {
    print_message "$green" "Updating simple-nvim"
    cd "$HOME/.config/nvim" || { print_message "$red" "Failed to navigate to $HOME/.config/nvim"; exit 1; }
    result=$(git pull)
    no_update_available="Already up to date."
    if [[ "$result" == *"$no_update_available"* ]]; then
        print_message "$red" "No update available"
    else
        print_message "$green" "Updated Neovim successfully"
    fi
}

function check_dependencies() {
    local missing_dependencies=0
    if ! command -v git &> /dev/null; then
        print_message "$red" "git could not be found"
        print_message "$yellow" "Please install git and try again"
        missing_dependencies=1
    fi

    if ! command -v nvim &> /dev/null; then
        print_message "$red" "nvim could not be found"
        print_message "$yellow" "Please install nvim and try again"
        missing_dependencies=1
    fi

    if [ $missing_dependencies -eq 1 ]; then
        exit 1
    fi
}

function install_simple_nvim() {
    if [ -d "$path/nvim" ]; then
        print_message "$green" "[INFO] Backing up your current nvim configuration..."
        rm -rf "$HOME/.config/nvim.bak"
        if ! mv "$HOME/.config/nvim" "$HOME/.config/nvim.bak"; then
            print_message "$red" "Failed to backup existing nvim configuration."
            exit 1
        fi
    fi

    mkdir -p "$path"
    cd "$path" || { print_message "$red" "Failed to navigate to $path"; exit 1; }
    if ! git clone "$REPOSITORY_URL" >/dev/null; then
        print_message "$red" "Failed to clone repository."
        exit 1
    fi
    repository_name=$(basename "$REPOSITORY_URL" .git)
    if ! mv "$repository_name" "nvim"; then
        print_message "$red" "Failed to set up neovim"
        exit 1
    fi
    cd .. || exit
    rm -rf "$repository_name"
    print_message "$green" "Simple-Nvim has been successfully installed."
}

function change_flavor() {
  local path="$HOME/.config/nvim/flavors"
  local config_path="$HOME/.config/nvim/lua/plugins"
  local theme_file="theme.lua"

  declare -A flavors
  flavors["1"]="gruvbox"
  flavors["2"]="catppuccin"
  flavors["3"]="tokyonight"
  flavors["4"]="nord"
  flavors["5"]="solarized"
  flavors["6"]="dracula"
  flavors["gruvbox"]="gruvbox"
  flavors["catppuccin"]="catppuccin"
  flavors["tokyonight"]="tokyonight"
  flavors["nord"]="nord"
  flavors["solarized"]="solarized"
  flavors["dracula"]="dracula"

  if [[ "$1" == "-l" ]]; then
    print_message "$yellow" "Aviable themes are:"
    print_message "$green" "1: gruvbox"
    print_message "$green" "2: catppuccin"
    print_message "$green" "3: tokyonight"
    print_message "$green" "4: nord"
    print_message "$green" "5: solarized"
    print_message "$green" "6: dracula"
    return 1
  fi

  local flavor="$1"
  
  if [[ -z "$flavor" ]]; then
    print_message "$red" "Error: No flavor specified."
    return 1
  fi

  local theme_name="${flavors[$flavor]}"
  
  if [[ -z "$theme_name" ]]; then
    print_message "$red" "Error: Invalid flavor specified."
    return 1
  fi

  local theme_path="$path/${flavors[$flavor]}.lua"
  local current_theme_path="$config_path/$theme_file"

  if [[ ! -f "$theme_path" ]]; then
    print_message "$red" "Error: Theme file not found at $theme_path."
    return 1
  fi

  print_message "$yellow" "Changing theme to $theme_name..."

  if [[ -f "$current_theme_path" ]]; then
    rm "$current_theme_path"
  fi

  cp "$theme_path" "$current_theme_path"
  print_message "$green" "Theme changed to $theme_name."
}

if [ "$1" == "-U" ]; then
    update_simple_nvim
elif [ "$1" == "-I" ]; then
    print_message "$green" "Welcome to the remote installer of Simple-Nvim"
    print_message "$yellow" "Checking for dependencies..."
    check_dependencies
    print_message "$green" "Installing Simple-Nvim..."
    install_simple_nvim
elif [ "$1" == "-C" ]; then
    change_flavor "$2"
else
    print_message "$yellow" "Usage: father.sh [command] [options]"
    echo ""
    print_message "$green" "-I to install simple nvim in your system" 
    print_message "$green" "-U to update simple nvim" 
    print_message "$green" "-C <flavor> to change theme. Use -C -l to list available themes."
    exit 1
fi

