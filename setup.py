#!/usr/bin/python3

import errno
import subprocess
import sys
import os

home = os.environ.get("HOME")

def run_cmd(cmd: str) -> int:
    print(f"Running $ {cmd}")
    return subprocess.call(cmd.split(' '))

def install_apt_packages():
    print("Installing bat using dpkg")
    run_cmd(f"sudo dpkg -i {home}/dotfiles/debs/bat_0.15.4_amd64.deb")

    print("Installing zsh from apt")
    ret = run_cmd("sudo apt install zsh")
    if ret != 0:
        print("Unable to install packages! Possibly due to lack of root/sudo.")
        response = input("Setup everything that doesn't require sudo? (y/n): ").lower()
        if (response != "y" and response != "yes"):
            print("Exiting")
            sys.exit()
    print("\n")

def symlink():
    flinks = [
        f"ln -s {home}/dotfiles/.zshrc {home}/.zshrc",
        f"ln -s {home}/dotfiles/.p10k.zsh {home}/.p10k.zsh",
        f"ln -s {home}/dotfiles/.gitconfig {home}/.gitconfig"
    ]

    dlinks = [
        f"ln -s {home}/dotfiles/bin {home}/bin",
        f"ln -s {home}/dotfiles/.zsh-plugins {home}/.zsh-plugins"
    ]

    print("Creating symlinks")
    # File symlinks
    for flink in flinks:
        run_cmd(flink)
    print("\n")
    
    print("Creating directory symlinks")
    # Dir symlinks
    for dlink in dlinks:
        run_cmd(dlink)
    print("\n")

def change_shell():
    print("Changing shell, password may be required")
    run_cmd("chsh -s /usr/bin/zsh")
    print("\n")

print("Ben Mitchell's dotfiles setup! v1.0")
run_cmd("git submodule update --init")
install_apt_packages()
symlink()
change_shell()
print("Done! Restart your shell to see the effects!")
