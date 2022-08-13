motd() {
    #PF_INFO="ascii title os host kernel uptime palette" $(command -v pfetch)
    nitch
    fortune
}

[ "$TERM_PROGRAM" != "vscode" ] && motd && echo
