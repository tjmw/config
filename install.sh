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
