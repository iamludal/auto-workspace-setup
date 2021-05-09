#!/bin/bash

create_symlinks()
{
  dir=$(dirname $0)
  hidden_files=$(ls $dir -A -I symlinks.sh -I .git -I $dir)

  for file in $hidden_files
  do
    ln -sfn $dir/$file ~/$file
    
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
  echo "Aborted"
  exit 1
fi

