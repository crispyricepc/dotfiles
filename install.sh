#!/usr/bin/env bash

# Colors (cos fancy)
RESET="\033[0m"
RED="\033[0;31m"
BLUE="\033[0;34m"

[ -z $XDG_CONFIG_DIR ] && XDG_CONFIG_DIR=$HOME/.config

echo "Checking dependencies..."

EXE_EXISTS="command -v"
DIR_EXISTS="ls -dh"

DEPENDENCIES=(
    "$EXE_EXISTS zsh"
    "$EXE_EXISTS i3"
    "$EXE_EXISTS polybar"
    "$EXE_EXISTS rofi"
    "$EXE_EXISTS picom"
    "$EXE_EXISTS lxqt-policykit-agent"
    "$EXE_EXISTS feh"
    "$EXE_EXISTS exa"
    "$EXE_EXISTS bat"
    "$EXE_EXISTS rsync"
    "$EXE_EXISTS dunst"
    "$EXE_EXISTS konsole"
    "$EXE_EXISTS dolphin"
    "$DIR_EXISTS /usr/share/icons/Papirus"
)

FOUND=0
for DEP in "${DEPENDENCIES[@]}"
do
    printf "$BLUE$DEP$RESET: "
    ! $DEP 2>/dev/null && printf "${RED}failed$RESET\n" && FOUND=1
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
