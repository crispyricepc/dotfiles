import yaml
import subprocess
import sys
import pathlib


def update_submodules():
    print("Updating submodules...")
    try:
        subprocess.check_call(
            ["git", "submodule", "update", "--init", "--recursive"])
    except:
        print(
            "There was a problem with updating submodules. Things might still work, but can't be guaranteed\nWould you like to continue (y/n): ",
            end='',
            file=sys.stderr)
        if (input().lower() == "n"):
            sys.exit(1)


def refresh_symlinks():
    print("Refreshing symbolic links by deleting and readding them...")
    home = pathlib.Path.home()
    try:
        with open("setup/symlinks.yaml", 'r') as stream:
            links = yaml.safe_load(stream)
            for link in links:
                print(f"Removing symlink to '{home}/{link}'")
                subprocess.check_call(["rm", "-rf", f"{home}/{link}"])

    except OSError:
        print(
            "File 'setup/symlinks.yaml' not found, assuming first time setup. Continuing...")
    except yaml.YAMLError as exc:
        print(exc, file=sys.stderr)

    # Symlinks relative to this folder, should be linked to the same place in ~
    symlinks = [
        # The main configuration file
        ".zshrc",
        # A zsh plugin manager
        ".zinit",
        # My custom fast scripts
        "bin"
    ]
    for link in symlinks:
        print(f"Creating symlink to '{home}/{link}'")
        subprocess.check_call(
            ["ln", "-s", f"{home}/dotfiles/{link}", f"{home}/{link}"])

    with open("setup/symlinks.yaml", 'w') as stream:
        try:
            yaml.safe_dump(symlinks, stream)
        except yaml.YAMLError as exc:
            print(exc, file=sys.stderr)


def check_for_packages():
    packages = [
        ("zsh", "A POSIX-compliant bash alternative",
         "https://sourceforge.net/projects/zsh/"),
        ("bat", "A colourful cat clone",
         "https://github.com/sharkdp/bat")
    ]
    print("The following packages are required for these dotfiles to fully function:")
    for pack in packages:
        print(f"{pack[0]}: {pack[1]},\n\tInstallation: {pack[2]}")
    print()

    print("Once you have these packages, run 'chsh -s zsh' and enjoy the features!")


print("Ben's dotfiles! MK II\n")
update_submodules()
print()
refresh_symlinks()
print()
check_for_packages()
