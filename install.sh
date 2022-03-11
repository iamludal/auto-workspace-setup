#!/bin/bash

dotfiles_dir=$PWD/$(dirname $0)
excluded=(.git README.md install.sh)

create_symlinks()
{
  find_cmd="find . -maxdepth 1"

  for file in ${EXCLUDED[@]}; do
    find_cmd="$find_cmd -not -name $file"
  done

  hidden_files=$(eval $find_cmd)

  for file in $hidden_files
  do
    ln -sf $dotfiles_dir/$file ~/$file
    
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

