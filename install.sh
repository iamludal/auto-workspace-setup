#!/bin/bash

excluded=(.git README.md flameshot.conf)

create_symlinks()
{
  dotfiles_dir=$(dirname `readlink -f $0`)
  current_script=$(basename $0)
  command="ls -A $dotfiles_dir"
  excluded+=($current_script)

  for file in ${excluded[@]}; do
    command="$command -I $file"
  done

  hidden_files=$(eval $command)

  echo $command
  echo $hidden_files

  exit -1

  for file in $hidden_files; do
    ln -sf $dotfiles_dir/$file ~/$file

    if [[ $? -eq 0 ]]
    then
        echo "[i] $file : ok"
    else
        echo "[x] $file : error"
    fi
  done
}

main()
{
  read -p "[?] Create symbolic links? This will overwrite your exiting ones. [y/N] " answer

  if [[ $answer =~ ^[Yy]$ ]]
  then
    echo "[i] Creating symlinks..."
    create_symlinks
  else
    echo "[x] Aborted"
    exit 1
  fi
}

main
