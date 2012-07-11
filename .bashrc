# Bash completion
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# Git helpers
source /Users/tom/dev/scripts/.git-completion.sh
source /Users/tom/dev/scripts/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

PS1='\u@\h \W$(__git_ps1 " (%s)")\$ '

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
