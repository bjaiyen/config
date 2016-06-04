#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"/home
echo "Running $0 against $SCRIPT_DIR"

# Symlink files.
for file in $(ls -A "$SCRIPT_DIR")
do
  if [ -f "$SCRIPT_DIR/$file" ]
  then
    echo $file
    ln -fs $SCRIPT_DIR/$file $HOME/$file
  fi
done

mkdir -p .vim
mkdir -p .vim/backup
mkdir -p .vim/swap

# Symlink folders
for folder in $(ls -A "$SCRIPT_DIR/.vim")
do
  echo $folder
  ln -fsn $SCRIPT_DIR/.vim/$folder $HOME/.vim/$folder
done

ln -fsn $SCRIPT_DIR/.bjaiyen $HOME/.bjaiyen
