# Place ZSH functions here in the form 'function FUNCTION_NAME() { ... }'.
# e.g:
# function fasd() {
#     find-or-exec $1
# }

# From https://wiki.archlinux.org/title/Rsync#Trailing_slash_caveat
# Depends on rsync
function cp {
    new_args=();
    for i in "$@"; do
        case $i in /) i=/;; */) i=${i%/};; esac
        new_args+=$i;
    done
    rsync "${(@)new_args}"
}

# A better diff
function batdiff() {
    bat --diff .zshrc
}
