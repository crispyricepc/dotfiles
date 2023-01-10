motd() {
    PF_INFO="ascii title os host kernel uptime palette" $(command -v pfetch)
    $(command -v fortune)
}

[ "$TERM_PROGRAM" != "vscode" ] && motd && echo
