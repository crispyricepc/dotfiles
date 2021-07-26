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

