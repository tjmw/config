# Commented this 17/8/2021 as it was breaking pyenv
# Added from https://github.com/creationix/nvm/issues/1652:
# PATH="/usr/local/bin:$(getconf PATH)"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git asdf zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR=vim
# Quit less immediately if less than one page of output (behave like cat)
export LESS=-RFX
export PATH="$HOME/.bin:$PATH"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

#eval "$(rbenv init - --no-rehash)"
#eval "$(hub alias -s)"

alias be='bundle exec'
alias fixcamera='sudo killall VDCAssistant'
alias gg='git grep'
alias gst='git status'
alias gco='git checkout'
alias migrate='bundle exec rake db:migrate db:test:prepare'
alias rdb='be rails dbconsole'
alias ta='tmux attach -t'
alias tl='tmux list-sessions'
alias tn='tmux new -s'
alias tnc='tmux new -s `basename $(pwd)`'
alias trc='tmux source-file ~/.tmux.conf'
alias vi='vim'

# Use Alt-Left and Alt-Right to move back and forward by word. Also requires
# mappings in iTerm (to send the right escape sequence - Esc-b and Esc-f)
bindkey "[D" backward-word
bindkey "[C" forward-word
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# https://github.com/zsh-users/zsh-syntax-highlighting
#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#export PATH="/usr/local/opt/qt@5.5/bin:$PATH"

#. $HOME/.asdf/asdf.sh

#. $HOME/.asdf/completions/asdf.bash

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

#export JAVA_HOME=$(/usr/libexec/java_home)

eval "$(pyenv init --path)"
eval "$(fnm env --use-on-cd)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="/Users/tom_wey/.sdkman"
#[[ -s "/Users/tom_wey/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/tom_wey/.sdkman/bin/sdkman-init.sh"

export PATH="$HOME/.cargo/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/Tom_Wey/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/Tom_Wey/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/Tom_Wey/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/Tom_Wey/google-cloud-sdk/completion.zsh.inc'; fi

# export PATH="/Applications/IntelliJ IDEA.app/Contents/MacOS:$PATH"

source <(fzf --zsh)
