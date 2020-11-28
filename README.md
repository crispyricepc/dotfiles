# My Dotfiles!

Super simple *TERMINAL ONLY* dotfiles that don't require you to download too many dependencies.

The idea of these dotfiles is to get a terminal (say WSL) user to be up and running with a tasteful rice in seconds, with as many or as few optional dependencies as they want.

## Quick Install

Run the following command:

```
cd ~ && git clone https://github.com/CRISPYricePC/dotfiles.git && cd dotfiles && ./setup.sh
```

This will quickly clone the dotfiles into your home directory and set it up

If you need to quickly update, you can rerun `./setup.sh` again and everything will be updated automagically

## Slower, more boring install

You *must* install this dotfiles folder in `~/dotfiles`, anywhere else and they won't work. The quick-install command clones via https, but you may prefer to use ssh if you're already setup with GitHub.

### Dependencies

There's a few, some of them aren't strictly necessary:
- zsh - *Required*, a highly extensible bash replacement
- bat - *Required*, a colourful cat replacement
- exa - *Required*, a colourful ls replacement
- CMake - *Not Required*, lets you run `cppbuild` on a CMake project to quickly compile it
- maim - *Not Required*, if you use a window manager, typing `screenshot_window` will take a screenshot of your window
