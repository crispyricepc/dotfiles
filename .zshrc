fpath=(~/.zfunc $fpath)

for FILE in ${XDG_CONFIG_DIR:-$HOME/.config}/zsh/*; do
    [ -f $FILE ] && source $FILE
done

for FILE in ${XDG_CONFIG_DIR:-$HOME/.config}/zsh-custom/*; do
    [ -f $FILE ] && source $FILE
done
