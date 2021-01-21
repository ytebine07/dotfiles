#!/bin/bash

echo "source \$HOME/dotfiles/zsh/zshrc.aliases" >> "$HOME/.zshrc"

git config --global alias.br "branch"
git config --global alias.co "checkout"
git config --global alias.st "status"
git config --global color.ui auto

