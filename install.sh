#!/usr/bin/env bash

mkdir -p vim

function yesno()
{
    SIZE_X=40
    SIZE_Y=6
    USAGE='
  Usage: yesno "command" "prompt text" ["skiptext"]
Example: yesno "./chrome.sh" "Install Google Chrome?" "Not installing Chrome"
    '
    if [ $# -eq 0 ]; then
        echo $USAGE
    else
        if dialog --yesno "$2" $SIZE_Y $SIZE_X; then
            $1
        else
            echo "Skipping $2"
        fi
    fi
}

sudo apt-get update
sudo apt-get install dialog || exit

pkglist=""
n=1
for pkg in $(cat apt_packages.txt gui_packages.txt pip_packages.txt)
do
  pkglist="$pkglist $pkg $n on"
  n=$[n+1]
done

choices=`/usr/bin/dialog --stdout --checklist 'Choose item:' 80 40 20 $pkglist |
sed s/\"//g`

# TODO ask which gui packages to install and install at same time as others

sudo apt-get install $choices

# TODO check what distro is in use
# TODO turn these into choices as well just like packages are
#yesno "curl -L http://install.ohmyz.sh | sh" "Install oh-my-zsh"
yesno "./ubuntu/all.sh" "Ubuntu 14.04 shortcuts and configurations"
yesno "./chrome.sh" "Install Google Chrome Browser"
yesno "./ubuntu/fixubuntu.sh" "Fixubuntu privacy fixes"
yesno "python ./get-pip.py" "Install PIP"
yesno "mkdir $HOME/.vimundo" "Vim remembers undo history"
yesno "./vundle" "Install Vundle"

