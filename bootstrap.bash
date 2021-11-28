#!/bin/bash

mkdir -p ~/.config

# Ubuntu-specific
if grep -q ID=ubuntu /etc/os-release; then
    if whiptail --yesno "Ubuntu detected. Install Ubuntu-specific apps?" 20 80 ;then
        echo -e "\nUbuntu OS, installing some must-haves"
        # Clean-up snap firefox
        sudo snap remove firefox

        # Latest stable neovim
        sudo add-apt-repository ppa:neovim-ppa/stable

        # Basic software
        sudo apt update
        sudo apt install zsh ripgrep pwgen ncal neovim tmux lm-sensors tldr cmake curl easy-rsa fonts-hack-ttf \
            gcc git jq nodejs npm ranger suckless-tools tmuxinator whois wmctrl xclip xdotool yarnpkg

        # GUI
        if whiptail --yesno "Install GUI stuff?" 10 60 ;then
            sudo apt install firefox thunderbird thunderbird-locale-en-us thunderbird-locale-ru chromium-browser
        fi
    fi
fi

# Vim
echo -e "\nInstalling Vundle..."
if [[ ! -d "$HOME/.vim/bundle/Vundle.vim" ]]
then
    mkdir -p ~/.vim/bundle
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
else
    echo "Vundle is already installed"
fi

# Shell
echo -e "\nInstalling base16 shell themes..."
if [[ ! -d "$HOME/.config/base16-shell" ]]
then
    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
else
    echo "Base16 shell themes are already installed"
fi

echo -e "\nInstalling oh-my-zsh..."
if [[ ! -d "$HOME/.oh-my-zsh" ]]
then
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "oh-my-zsh is already installed"
fi

echo -e "\nSet up main symlinks..."
ln -sf $PWD/.config/nvim/init.vim $HOME/.config/nvim/init.vim
ln -sf $PWD/.zshrc $HOME/.zshrc

mkdir -p $HOME/.config/tmux
ln -sf $PWD/.config/tmux/tmux.conf $HOME/.config/tmux/tmux.conf
ln -sf $PWD/.config/tmux/ilya-m.tmuxtheme $HOME/.config/ilya-m.tmuxtheme

echo -e "And copy rest of it"
cp -r $PWD/.oh-my-zsh $HOME/

echo -e "\nAll done!"
