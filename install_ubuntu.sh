#!/bin/bash

echo "Running install.sh"

ALIASES_TARGET="$HOME/dotfiles/.bash_aliases"
ALIASES_LINK="$HOME/.bash_aliases"

if [ ! -L "$ALIASES_LINK" ]; then
  ln -s "$ALIASES_TARGET" "$ALIASES_LINK"
  echo "Created symlink: $ALIASES_LINK -> $ALIASES_TARGET"
fi

sudo apt -y update
sudo apt install fzf

add_to_bashrc() {
    local line="$1"
    grep -qxF -- "$line" "$HOME/.bashrc" || echo "$line" >> "$HOME/.bashrc"
}

# Setup git autocompletions
add_to_bashrc 'source /usr/share/bash-completion/completions/git'
# Make it work with the g alias
add_to_bashrc '__git_complete g __git_main'

# Add the dependencyTree plugin
mkdir -p "$HOME/.sbt/1.0/plugins"
file="$HOME/.sbt/1.0/plugins/plugins.sbt"
grep -qxF 'addDependencyTreePlugin' "$file" 2>/dev/null || echo 'addDependencyTreePlugin' >> "$file"
