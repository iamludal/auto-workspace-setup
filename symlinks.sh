#!/bin/bash

#git pull

hidden_files=$(ls -A -I symlinks.sh -I .git) 

create_symlinks()
{
 for file in $hidden_files
 do
    ln -sfn dotfiles/$file ~/$file
 done
}

echo "Create symbolic links? This will overwrite your exiting ones. [y/N]"
read

if [[ $REPLY =~ ^[Yy]$ ]]
then
  create_symlinks
else
  echo Aborted
fi

