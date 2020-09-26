import errno
import subprocess
import sys

def run_cmd(cmd: str) -> int:
    print(f"Running $ {cmd}")
    return subprocess.call(cmd.split(' '))

def install_apt_packages():
    print("Installing zsh and bat")
    ret = run_cmd("apt install zsh bat")
    if ret != 0:
        print("Unable to install packages! Possibly due to lack of root/sudo.")
        response = input("Setup everything that doesn't require sudo? (y/n): ").lower()
        if (response != "y" and response != "yes"):
            print("Exiting")
            sys.exit()
    print("\n")

def symlink():
    flinks = [
        "ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc",
        "ln -s $HOME/dotfiles/.p10k.zsh $HOME/.p10k.zsh",
        "ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig"
    ]

    dlinks = [
        "ln -s $HOME/dotfiles/bin $HOME/bin",
        "ln -s $HOME/dotfiles/.zsh-plugins $HOME/.zsh-plugins"
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
install_apt_packages()
symlink()
change_shell()
print("Done! Restart your shell to see the effects!")