# bash_aliases file
# version 2
# author max
#
# Aliases in this file are usually short and things I already remeber but don't
# want to type every time I use them
# Functions are for things I don't remember or things that are complicated

# acronyms used
#fct=fix common typo
#pwd=current working directory

EDITOR=vim

alias duh='du -h --max-depth=1'
alias breload='source $HOME/.bashrc'

swapCaps()
{
    if xmodmap -pke | egrep -i "escape" | egrep -i "keycode.*9.*"; then
        xmodmap -e "clear lock"
        xmodmap -e "keycode 66 = Escape"
        xmodmap -e "keycode 9 = Caps_Lock"
        xmodmap -e "add Lock = Caps_Lock"
    fi
}

# doing this in this file is probably bad practice
swapCaps

# counts the amount of files, prints number
alias files='ls -a1 | wc -l'
# fct
alias sl='ls'
# find large files in pwd quickly (even hidden ones)
alias lh='ls -lahrS'
alias l='ls'
alias ll='ls -la'

# apt-get
alias sagi='sudo apt-get install'
alias sagu='sudo apt-get -y update; sudo apt-get -y upgrade; sudo apt-get -y autoremove;'
alias sagr='sudo apt-get remove'

wiki() { dig +short txt `echo $@ | sed -e s/\ //g`.wp.dg.cx; }

deploy-virtualenv() {
    virtualenv --no-site-packages --distribute .env
    source .env/bin/activate
    pip install -r requirements.txt
}

alias mkdir='mkdir -p'

# cd stuff and acceptable features from windows
alias cls='clear'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias u='cd ..'
alias uu='cd ../..'
alias uuu='cd ../../..'
alias uuuu='cd ../../../..'
alias uuuuu='cd ../../../../..'
alias uuuuuu='cd ../../../../../..'
alias uuuuuuu='cd ../../../../../../..'

newsh() {
    if [ -f $1 ]; then
        echo "Will not use existing files";
    else
        echo $'#!/usr/bin/env bash\n' >> $1;
        chmod +x $1
        $EDITOR $1
    fi
}

#very easy way to decompress almost anything
ex() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)  tar xvjf $1   ;;
            *.tar.gz)   tar xvzf $1   ;;
      *.tar.xz)   tar xvJf $1   ;;
			*.bz2)      bunzip2 $1    ;;
			*.rar)      unrar x $1    ;;
			*.gz)       gunzip $1     ;;
			*.tar)      tar xvf $1    ;;
			*.tbz2)     tar xvjf $1   ;;
			*.tgz)      tar xvzf $1   ;;
			*.zip)      unzip $1      ;;
			*.Z)        uncompress $1 ;;
			*.7z)       7z x $1       ;;
      *.xz)       unxz $1       ;;
			*.exe)      cabextract $1 ;;
			*)          echo "'$1': unrecognized file compression `file $1`" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}
