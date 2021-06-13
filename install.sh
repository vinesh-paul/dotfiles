#!/usr/bin/env bash

if [[ $# -ne 1 ]]; then
  echo "Usage: install.sh <home directory>"
  exit 1
fi

homedir=$1

#dotfile directory
dotfilesdir=${homedir}/dotfiles

#list of files to symlink to homedir
files="aliases bashrc bash_profile functions"

#change to dotfiles directory
echo "Changing to dotfilesdir : ${dotfilesdir}"
cd ${dotfilesdir}


#create symlinks from git cloned directory to home directory
for file in ${files}; do
  echo "Creating symlink from ${dotfilesdir}/.${file} to ${homedir}/.${file}"
  ln -sf ${dotfilesdir}/.${file} ${homedir}/.${file}
done

#download git auto completion
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
