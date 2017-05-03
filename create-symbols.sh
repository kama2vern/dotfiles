#!/usr/bin/env bash

# Variables
user_root=/Users/${USER}
src_root=${user_root}/src/github.com/kama2vern
dotfiles_dir=${src_root}/dotfiles
linked_files=${dotfiles_dir}/home

# Move to linked dir
pushd ${linked_files} > /dev/null

# Create symbols
for dotfile in `find . -maxdepth 1 ! -name "." | sed 's/^.\///g'`; do
  if [[ ! -L ${user_root}/${dotfile} ]]; then
    ln -sv ${linked_files}/${dotfile} ${user_root}/${dotfile}
  fi
done

# Pop to original path
popd > /dev/null
