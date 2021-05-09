#!/bin/bash

create_symlinks()
{
  hidden_files=$(ls -A -I symlinks.sh -I .git) 

  for file in $hidden_files
  do
    ln -sfn .dotfiles/$file ~/$file
    
    if [[ $? -eq 0 ]]
    then
        echo "[i] $file : ok"
    else
        echo "[!] $file : error"
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
  echo "Aborted"
  exit 1
fi

