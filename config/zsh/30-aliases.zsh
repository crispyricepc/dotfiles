# Place aliases here in the format: 'alias ALIAS="command"'.
# e.g:
# alias l="ls -lh"

alias ls="exa --icons -1h"
if [[ $OSTYPE == "darwin"* ]]; then
    alias cat="bat --style=plain --theme=\$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo OneHalfDark || echo OneHalfLight)"
else
    alias cat="bat --style=plain --theme=\$([[ \$(gsettings get org.gnome.desktop.interface color-scheme) == \'prefer-dark\' ]] && echo OneHalfDark || echo OneHalfLight)"
fi
alias edit="\$EDITOR"
alias aur="yay"
alias man="BROWSER=firefox man --html"
