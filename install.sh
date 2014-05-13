#!/usr/bin/env bash

DOTFILES=$(pwd);

ln -s $DOTFILES/.bash_aliases ~/.bash_aliases
ln -s $DOTFILES/.vimrc ~/.vimrc

while ! which dialog; do
  sudo apt-get install dialog;
done
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

sudo apt-get update
sudo apt-get install $choices


if dialog --yesno "Install oh-my-zsh" 6 40; then
    curl -L http://install.ohmyz.sh | sh
else
    echo "Skipping oh-my-zsh"
fi

