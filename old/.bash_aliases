### old bash aliases file
### archived here for fun
### most things here from
### before i knew better.

# bash_aliases file
# author max
#fct=fix common typo
#pwd=current working directory
alias duh='du -h --max-depth=1'

# modify these to suit you
REMOTE_USER_NAME_BASH_ALIASES=grasbecm
REMOTE_SERVER_NAME_BASH_ALIASES=penti.sit.fi
TEXT_EDITOR=vim
BASH_ALIASES_BACKUP_NAME=.backup_aliases

## get the latest version of the aliases file
alias update-aliases='wget -O ~/.bash_aliases http://people.arcada.fi/~grasbecm/.bash_aliases'

## ~/.bash* related
# na = simpler than ea
alias na='nano ~/.bash_aliases'
alias va='vim ~/.bash_aliases'
# ea = edit aliases. 
alias ea='$TEXT_EDITOR ~/.bash_aliases; cp ~/.bash_aliases ~/$BASH_ALIASES_BACKUP_NAME; if ping -qc1 $REMOTE_SERVER_NAME_BASH_ALIASES >> /dev/null;
then if scp ~/.bash_aliases $REMOTE_USER_NAME_BASH_ALIASES@$REMOTE_SERVER_NAME_BASH_ALIASES:~/html/.bash_aliases;
then printf "aliases updated on remote server\n";
else printf "connection to remote server could not be established\n";
fi;
else printf "remote server cannot be pinged\n";
fi;'
# so open terminals can be updated after editing this (or other bashrc related) file
alias breload='source $HOME/.bashrc'

## grep related
# saves some time, if you remember to use it
alias g='grep'

## ls related
# counts the amount of files in pwd, prints number
alias files='ls -a1 | wc -l'
# fct
alias sl='ls'
# find large files in pwd quickly (even hidden ones)
alias lh='ls -lahrS'
alias l='ls'
alias ll='ls -la'


## progress bars to cp and mv
alias rscp='rsync -haP --no-whole-file --inplace'
alias rsmv='rscp --remove-source-files'

# human readable
alias df='df -h'

# for when you fail to autocomplete w/ tab
# disabled
#alias ifc='ifconfig'
#alias iwc='iwconfig'

# one letter commands
## fct
alias c='cd'
alias n='nano'
alias s='sudo'
alias t='top'
alias o='xdg-open '

# quick way to shut down system
alias die='echo Shut down system?; sudo shutdown -h now'

# apt-get
alias sagi='sudo apt-get install'
alias sagu='sudo apt-get -fy update; sudo apt-get -fy upgrade; sudo apt-get -fy autoremove'
alias sagr='sudo apt-get remove'
alias sags='sudo apt-cache search'

#unsorted mess
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
alias cls='clear'

alias resolution="xrandr  | grep \* | cut -d' ' -f4"
alias tsize='echo $COLUMNS x $LINES'

alias nohtml="sed -e :a -e 's/<[^<]*>/ /g;/</{N;s/\n/ /;ba;}'"
#just like the alterntive better
alias axel="axel -a"
alias video='vlc v4l2:///dev/video0'

loop() { while true; do $@; sleep 1; done; }
uloop() { until $@; do sleep 1; done; }
wiki() { dig +short txt `echo $@ | sed -e s/\ //g`.wp.dg.cx; }

#should try to include this somehow
#find -iname "*jpg" -exec cp "{}" target_dir/. \;

#very easy way to uncompress almost anything
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
