#!/usr/bin/env bash

if ! command -v zsh > /dev/null || ! command -v bat > /dev/null;
then
    echo -e "The programs 'bat' and 'zsh' are required for these dotfiles to work properly.
Everything will install correctly without the program(s) installed, but you won't be able to use some of the features until they are.\n"
    read -p "Continue the installation? [Y/n]: " -n 1 -r
    if [[ ! $REPLY =~ ^[Yy]$ ]];
    then
        exit 1
    fi
    echo -e "Continuing...\n"
fi

echo "Fetching and rebasing"
if ! (git fetch && git rebase origin master);
then
    echo "Rebase failed, is your local repository clean?"
    exit 1
fi
echo "Rebase succeeded"

echo "Updating submodules..."
if ! git submodule update --init --recursive;
then
    echo "Failed to update submodules! Try doing a fresh clone of this repository. If it still doesn't work, submit an issue"
    exit 1
fi
echo "Submodules updated!"

echo "Removing old symlinks..."
while read oldlnk
do
    echo "Remove: $HOME/$oldlnk"
    rm -rf $HOME/$oldlnk
done < setup/symlinks_installed
echo "Symlinks removed!"

echo "Adding new symlinks..."
> setup/symlinks_installed
while read newlnk
do
    echo "Link: $HOME/dotfiles/$newlnk - $HOME/$newlnk"
    ln -s $HOME/dotfiles/$newlnk $HOME/$newlnk
    echo $newlnk >> setup/symlinks_installed
done < setup/symlinks_needed
echo "Links created!"

echo -e "\nRunning chsh. Password is likely required (note: this is not asking for sudo and this script does not get to see your password)"
chsh -s $(which zsh)

echo "Thank you for installing my dotfiles!"