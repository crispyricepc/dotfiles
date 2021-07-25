#!/usr/bin/env bash

# Colors (cos fancy)
RESET="\033[0m"
RED="\033[0;31m"
BLUE="\033[0;34m"

[ -z $XDG_CONFIG_DIR ] && XDG_CONFIG_DIR=$HOME/.config

echo "Checking dependencies..."

DEPENDENCIES=(
    "zsh"
    "i3"
    "polybar"
    "rofi"
    "picom"
    "lxqt-policykit-agent"
    "feh"
    "exa"
    "bat"
)

FOUND=0
for DEP in "${DEPENDENCIES[@]}"
do
    printf "$BLUE$DEP$RESET: "
    ! command -v $DEP && printf "${RED}not found$RESET\n" && FOUND=1
done

[[ FOUND -ne 0 ]] && exit $FOUND

cd config
for CFG_DIR in *
do
    TARGET_DIR=$XDG_CONFIG_DIR/$CFG_DIR
    [ -L $TARGET_DIR ] && continue
    rm -rf $TARGET_DIR.old
    mv $TARGET_DIR $TARGET_DIR.old 2>/dev/null &&
    echo -e "Moved $TARGET_DIR -> $TARGET_DIR.old"
    
    ln -s $PWD/$CFG_DIR $TARGET_DIR &&
    echo -e "Linked $PWD/$CFG_DIR -> $TARGET_DIR"
done
cd - > /dev/null

exit 0
