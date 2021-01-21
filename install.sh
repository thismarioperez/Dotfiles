#!/bin/bash
################################################################################
# install.sh
# This script installs brew packages from Brefile
################################################################################
################################################################################
# Variables
################################################################################
NC='\033[0m'     # No Color
Cya='\033[0;36m' # Cyan
Red='\033[0;31m' # Red
Whi='\033[1;37m' # White
################################################################################
# Functions
################################################################################
################################################################################
# Installs packages from dotfiles Brewfile
################################################################################
install_brew_packages() {
    # Test to see if homebrew is installed.  If it is:
    if [ -x "$(command -v brew)" ]; then
        echo -e "${Cya}Installing packages from Brewfile${NC}"
        brew bundle --file Brewfile
        mkdir $HOME/nvm # Make nvm directory
    else
        # Alert user to install homebrew and stop script
        echo -e "${Red}Please install Homebrew, then re-run this script!${NC}"
        echo -e "${Whi}Visit${NC} ${Cya}https://brew.sh${NC} ${Whi}for installation instructions.${NC}"
        exit 1
    fi
}
################################################################################
# Install Homebrew Packages
################################################################################
install_brew_packages
