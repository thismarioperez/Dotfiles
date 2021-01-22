#!/bin/bash
################################################################################
# install.sh
# This script installs brew packages from Brefile
################################################################################
source ${PWD}/variables.sh
source ${PWD}/setup.sh
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
        $(brew --prefix)/opt/fzf/install # Install fzf key bindings and fuzzy complete
        mkdir $HOME/nvm # Make nvm directory
        setup
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
