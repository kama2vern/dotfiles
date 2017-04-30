#!/usr/bin/env bash

# Install homebrew if not installed
which brew > /dev/null
if [ "$?" -ne 0 ]; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  # Install bundle & mas-cli
  brew tap Homebrew/bundle
  brew install mas
fi
