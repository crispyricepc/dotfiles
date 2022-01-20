#!/usr/bin/env bash

# Colours (cos fancy)
RESET="\033[0m"
RED="\033[0;31m"
GREEN="\033[0;32m"
YELLOW="\033[0;33m"
BLUE="\033[0;34m"

# Check this script is in $HOME/.dotfiles
DOTFILES_DIR=$HOME/.dotfiles
[ $(readlink -f $(dirname $0)) != $DOTFILES_DIR ] && { echo -e "${RED}ERROR${RESET}: This script must be run from $HOME/.dotfiles" >&2; exit 1; }

CFG_DIR=${XDG_CONFIG_DIR:-$HOME/.config}
REL_DOTFILES_DIR=$(realpath --relative-to=$CFG_DIR $DOTFILES_DIR)

command-exists() {
    printf "Checking for $1... "
    command -v "$1" >/dev/null 2>&1 && echo -e "${GREEN}OK${RESET}" || { echo -e >&2 "${RED}NOT FOUND${RESET}"; return 1; }
}

dir-exists() {
    printf "Checking for $1... "
    [ -d "$1" ] && echo -e "${GREEN}OK${RESET}" || { echo -e >&2 "${RED}NOT FOUND${RESET}"; return 1; }
}

file-exists() {
    printf "Checking for $1... "
    [ -f "$1" ] && echo -e "${GREEN}OK${RESET}" || { echo -e >&2 "${RED}NOT FOUND${RESET}"; return 1; }
}

font-exists() {
    printf "Checking for $1... "
    FONT=$(fc-match -f "%{family[0]}\n" "$1")
    [ "$FONT" == "$1" ] && echo -e "${GREEN}OK${RESET}" || { echo -e >&2 "${RED}NOT FOUND${RESET}"; return 1; }
}

required() {
    FOUND=0
    command-exists zsh || FOUND=1
    command-exists bspwm || FOUND=1
    command-exists polybar || FOUND=1
    command-exists rofi || FOUND=1
    command-exists feh || FOUND=1
    command-exists dunst || FOUND=1
    command-exists dex || FOUND=1
    command-exists maim || FOUND=1
    command-exists xclip || FOUND=1
    command-exists xdotool || FOUND=1
    command-exists picom || FOUND=1
    command-exists exa || FOUND=1
    command-exists bat || FOUND=1
    command-exists rsync || FOUND=1
    dir-exists /usr/share/icons/Papirus || FOUND=1
    file-exists /usr/lib/polkit-kde-authentication-agent-1 || FOUND=1
    font-exists 'JetBrainsMono Nerd Font' || FOUND=1
    font-exists 'JetBrains Mono' || FOUND=1
    
    return $FOUND
}

echo "Checking dependencies..."
required && echo -e "${GREEN}SUCCESS${RESET}: All dependencies found" ||
    echo -e >&2 "${YELLOW}WARNING${RESET}: Some dependencies were missing. Some features may not work"

read -p "Would you like to begin the installation? [Y/n] " ANSWER
[ "$ANSWER" != "Y" ] && [ "$ANSWER" != "y" ] && [ ! -z "$ANSWER" ] && exit 1

mkdir -p $CFG_DIR && cd $CFG_DIR && echo "Changed into $CFG_DIR"
for DIR in $(find $REL_DOTFILES_DIR/config -maxdepth 1 -mindepth 1); do
    DIR_NAME=$(basename $DIR)
    printf "Linking $DIR_NAME -> $DIR... "
    [ -L $DIR_NAME ] && {
        printf "${YELLOW}RMLINK ${RESET}"
        rm -rf $DIR_NAME
    }
    [ -d $DIR_NAME ] && {
        printf "${YELLOW}BACKUP ${RESET}"
        mv $DIR_NAME $DIR_NAME.bak
    }
    ln -sf $DIR $DIR_NAME && echo -e "${GREEN}DONE${RESET}"
done

echo "Symlinks were removed, existing directories were backed up"

exit 0
