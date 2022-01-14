#!/bin/bash

create_symlinks()
{
  dotfiles_dir=$PWD/$(dirname $0)
  current_script=${0##*/}
  hidden_files=$(ls $dotfiles_dir -A --ignore={.git,README.md,$current_script})

  for file in $hidden_files
  do
    ln -sf $dir/$file ~/$file
    
    if [[ $? -eq 0 ]]
    then
        echo "[i] $file : ok"
    else
        echo "[x] $file : error"
    fi
  done
}

echo -n "[?] Create symbolic links? This will overwrite your exiting ones. [y/N] "
read

if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "[i] Creating symlinks..."
  create_symlinks
else
  echo "[x] Aborted"
  exit 1
fi

