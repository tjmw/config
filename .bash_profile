# Bash completion
if [ -f /etc/bash_completion ]; then
  . /etc/bash_completion
fi

# Git helpers
source $HOME/dev/scripts/.git-completion.sh
source $HOME/dev/scripts/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

export PS1='\[\033[1;35m\]\u@\h \w$(__git_ps1 " (%s)") \[\033[0;33m\]$ \[\033k\033\\\]\[\033[0m\]'

export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$PATH:/usr/local/mysql/bin # MySQL binaries

export EDITOR=vim

alias be='bundle exec'
alias migrate='bundle exec rake db:migrate db:test:prepare'
alias rdb='be rails dbconsole'
alias ta='tmux attach -t'
alias tl='tmux list-sessions'
alias tn='tmux new -s'
alias vi='vim'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Print gem location
function gemloc {
  ruby -e "puts Gem::Specification.find_by_name('$1').gem_dir"
}

function tags {
  ctags --exclude=.git --exclude=log --exclude=public --exclude='*.js' --exclude='*.coffee' --exclude=tmp -R -f .tags *
}

function top10 {
  history | awk '{a[$2]++ } END{for(i in a){print a[i] " " i}}'|sort -rn |head -n 10
}
