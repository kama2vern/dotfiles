#!/usr/bin/env bash

# Variables
tempfile=/tmp/dotfiles.zip
workspace=/tmp/dotfiles
src_root=/Users/${USER}/src/github.com/kama2vern
dotfiles_dir=${src_root}/dotfiles
linked_files=${dotfiles_dir}/home

# Download zipped dotfiles
curl -LSfs -o ${tempfile} https://github.com/kama2vern/dotfiles/archive/master.zip

# Unzip dotfiles into workspace
unzip -oq ${tempfile} -d ${workspace}

# Move to repository root path
pushd ${workspace}/dotfiles-master > /dev/null

# Install command-line-tools
./install-command-line-tools.sh

# Install homebrew
./install-homebrew.sh

# Update homebrew
brew update

# Run installer
brew bundle

# clone dotfiles to link symbols if not exists
if [[ ! -d ${dotfiles_dir} ]]; then
  mkdir -p ${src_root}
  git clone git@github.com:kama2vern/dotfiles.git ${dotfiles_dir}
fi

# Create symbols
./create-symbols.sh

# Pop to original path
popd > /dev/null

# Cleanup
rm -rf ${tempfile} ${workspace}
