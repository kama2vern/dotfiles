#!/usr/bin/env bash

# Install command-line-tools if not installed
if [[ ! -d /usr/include ]]; then
  PLACEHOLDER=/tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
  touch $PLACEHOLDER
  PROD=$(softwareupdate -l | grep "\*.*Command Line" | head -n 1 | awk -F"*" '{print $2}' | sed -e 's/^ *//' | tr -d '\n')
  softwareupdate -i "${PROD}"
  [[ -f $PLACEHOLDER ]] && rm $PLACEHOLDER
fi
