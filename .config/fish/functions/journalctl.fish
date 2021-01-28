function journalctl
    /bin/journalctl $argv | ccze -A -o nolookups
end