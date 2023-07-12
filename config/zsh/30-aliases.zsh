# Place aliases here in the format: 'alias ALIAS="command"'.
# e.g:
# alias l="ls -lh"

alias ls="exa --icons -1h"
alias cat="bat --style=plain --theme=\$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo OneHalfDark || echo OneHalfLight)"
alias edit="\$EDITOR"
alias aur="pikaur"
alias man="BROWSER=firefox man --html"
