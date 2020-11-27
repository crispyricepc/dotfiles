#!/usr/bin/env bash

deps_satisfied=true

while read dep
do
    printf "Searching for $dep... "
    if ! command -v $dep > /dev/null
    then
        printf "\e[31mNOT FOUND\e[0m\n"
        deps_satisfied=false
    else
        printf "\e[32mFOUND\e[0m\n"
    fi
done < setup/deps

opt_deps_satisfied=true

while read opt_dep
do
    printf "Searching for $opt_dep (optional)... "
    if ! command -v $opt_dep > /dev/null
    then
        printf "\e[33mNOT FOUND\e[0m\n"
        opt_deps_satisfied=false
    else
        printf "\e[32mFOUND\e[0m\n"
    fi
done < setup/deps_opt

if [ "$deps_satisfied" = false ]
then
    echo -e "You must have the correct dependencies installed"
    exit 1
fi

if [ "$opt_deps_satisfied" = false ]
then
    echo -e "Some optional dependencies weren't found, install them to unlock all functionality\n"
    read -n 1 -s -r -p "Setup will continue after pressing a key..."
    echo ""
fi

printf "Fetching and rebasing... "
if ! (git fetch > /dev/null 2>&1 && git rebase origin master > /dev/null 2>&1)
then
    printf "\e[31mFAILED\e[0m\n"
    echo "Rebase failed, is your local repository clean?"
    exit 1
fi
printf "\e[32mDONE\e[0m\n"

echo "Updating submodules..."
if ! git submodule update --init --recursive
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
chsh -s $(command -v zsh)

echo "Thank you for installing my dotfiles!"