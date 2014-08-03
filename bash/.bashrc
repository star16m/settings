# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/home/star16m/.gvm/bin/gvm-init.sh" ]] && source "/home/star16m/.gvm/bin/gvm-init.sh"

# added by jkim
alias la='ls -al'
alias cls='clear'
