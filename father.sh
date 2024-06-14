REPOSITORY_URL="https://github.com/thelibertti/simple-Nvim"
repository_name="simple-Nvim"
path="$HOME/.config/nvim"
green="\033[0;32m"
red="\033[0;31m"
yellow="\033[0;33m"
reset="\033[0m"

print_message() {
    color=$1
    message=$2
    echo -e "${color}${message}${reset}"
}

function check_dependencies() {
    missing_dependencies=0
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
    if [ -d "$path" ]; then 
        print_message "$green" "[INFO] Backing up your current nvim configuration..."
        rm -rf "$path.bak"
        if ! mv "$path" "$path.bak"; then
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
    cd "$repository_name" || { print_message "$red" "Failed to navigate to $repository_name"; exit 1; }
    if ! mv * ../; then
        print_message "$red" "Failed to move nvim configuration files."
        exit 1
    fi
    cd .. || exit
    rm -rf "$repository_name"
    print_message "$green" "Simple-Nvim has been successfully installed."
}

print_message "$green" "Welcome to the remote installer of Simple-Nvim"
print_message "$yellow" "Checking for dependencies..."
check_dependencies
print_message "$green" "Installing Simple-Nvim..."
install_simple_nvim