function autoremove
    set pkgs (pacman -Qdtq)
    if test $status -eq 0
        sudo pacman -Rs $pkgs
        return 0
    end

    echo "No packages require autoremove"
    return 1
end