#!/usr/bin/env bash

DOTFILES=$(pwd);
SCRIPTSTATUS=""
function scriptstatus(){
    # used to keep track of what got installed
    # placeholder function
    # SCRIPTSTATUS=$SCRIPTSTATUS$@
    echo ""
}
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
            if [ -z "$3" ]; then
                echo $3
            else
                echo "Skipping $2"
            fi
        fi
    fi
}

ln -s $DOTFILES/.bash_aliases ~/.bash_aliases
ln -s $DOTFILES/.vimrc ~/.vimrc

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

sudo apt-get install $choices

yesno "curl -L http://install.ohmyz.sh | sh" "Install oh-my-zsh"
yesno "./ubuntu/all.sh" "Ubuntu 14.04 shortcuts and configurations?"
yesno "./chrome.sh" "Install Google Chrome Browser?"
