#!/usr/bin/env bash

DOTFILES=$(pwd);

function yesno() {
    SIZE_X=40
    SIZE_Y=6
    USAGE='
  Usage: yesno "command" "prompt text" ["skiptext"]
Example: yesno "./chrome.sh" "Install Google Chrome?" "Not installing Chrome"
    '
    if [ -z "$1" ]; then
        echo $USAGE
    else
        if dialog --yesno "$2" $SIZE_Y $SIZE_X; then
            $1
        else
            echo "Skipping $2"
        fi
    fi
}

ln -s $DOTFILES/bash_aliases ~/.bash_aliases
ln -s $DOTFILES/vimrc ~/.vimrc
ln -s $DOTFILES/vim ~/.vim
ln -s $DOTFILES/zshrc ~/.zshrc

sudo apt-get update
sudo apt-get install dialog || exit

pkglist=""
n=1
for pkg in $(cat packages.txt)
do
  pkglist="$pkglist $pkg $n on"
  n=$[n+1]
done

choices=`/usr/bin/dialog --stdout --checklist 'Choose item:' 80 40 20 $pkglist |
sed s/\"//g`

# TODO ask which gui packages to install and install at same time as others

sudo apt-get install $choices


yesno "curl -L http://install.ohmyz.sh | sh" "Install oh-my-zsh"
yesno "./ubuntu/all.sh" "Ubuntu 14.04 shortcuts and configurations"
yesno "./chrome.sh" "Install Google Chrome Browser"
yesno "./ubuntu/fixubuntu.sh" "Fixubuntu privacy fixes"

# pathogen installation, will test this fully later
# from: https://github.com/tpope/vim-pathogen/blob/master/README.markdown
#mkdir -p ~/.vim/autoload ~/.vim/bundle && \
#curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# something to install vim plugins with at some point..
# from: log.gopheracademy.com/vimgo-development-environment
# cd ~/.vim/bundle
# git clone https://github.com/fatih/vim-go.git
