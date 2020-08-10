#!/bin/zsh

# set rbenv path
echo '' >> ~/.zshrc
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"' >> ~/.zshrc
echo 'source $HOME/.zshenv' >> ~/.zshrc

# get the latest version of ruby
ver=`rbenv install --list | grep "^  [0-9].[0-9].[0-9]$" | tail -n 1 | tr -d ' '`
rbenv install $ver
rbenv global $ver
unset ver
