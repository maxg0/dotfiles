#!/usr/bin/env bash

DOTFILES=$(pwd);

ln -s $DOTFILES/.bash_aliases ~/.bash_aliases
ln -s $DOTFILES/.vimrc ~/.vimrc

sudo apt-get update
sudo apt-get install dialog || echo "unable to install dialog, quitting"; exit

pkglist=""
n=1
for pkg in $(cat packages.txt)
do
  pkglist="$pkglist $pkg $n on"
  n=$[n+1]
done

echo $pkglist

choices=`/usr/bin/dialog --stdout --checklist 'Choose item:' 80 40 20 $pkglist |
sed s/\"//g`

sudo apt-get install $choices

if dialog --yesno "Install oh-my-zsh" 6 40; then
    curl -L http://install.ohmyz.sh | sh
else
    echo "Skipping oh-my-zsh"
fi

if dialog --yesno "Ubuntu 14.04 shortcuts and configurations?"; then
    ./ubuntu-14.04-config/all.sh
else
    echo "Skipping ubuntu shortcuts
fi
