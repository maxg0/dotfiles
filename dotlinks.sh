#!/usr/bin/env bash

DOTFILES=$(pwd);

# makes a symbolic link but removes old links and backs up old files
# backs up old folders but if backup destination exists throws error instead
# ln does not treat directories like files when backing up (possible bug?)
function dotlink(){
    TARGET=$1
    LINK_NAME=$2

    if [ -h $2 ]; then
        rm $2
    fi

    if [ -d $2 ]; then

        if [ -e $2~ ]; then
            echo "ERROR: Tried to link a directory but it already has a backup"
            exit
        fi

        mv --backup=t $2 $2~
    fi

    ln -s --backup=t $1 $2
}

dotlink $DOTFILES/bashrc ~/.bashrc
dotlink $DOTFILES/bash_aliases ~/.bash_aliases
dotlink $DOTFILES/vimrc ~/.vimrc
dotlink $DOTFILES/vim ~/.vim
dotlink $DOTFILES/gitconfig ~/.gitconfig
dotlink $DOTFILES/tmux.conf ~/.tmux.conf
dotlink $DOTFILES/django_bash_completion ~/.django_bash_completion
dotlink $DOTFILES/pylintrc ~/.pylintrc
dotlink $DOTFILES/agignore ~/.agignore
