fpath=(~/.zfunc $fpath)

for FILE in ${XDG_CONFIG_DIR:-$HOME/.config}/zsh/*; do
    [ -f $FILE ] && source $FILE
done

test -d ${XDG_CONFIG_DIR:-$HOME/.config}/zsh-custom &&
for FILE in ${XDG_CONFIG_DIR:-$HOME/.config}/zsh-custom/*; do
    [ -f $FILE ] && source $FILE
done

test -d /usr/share/zsh/plugins &&
for PLUG in /usr/share/zsh/plugins/*; do
    [ -d $PLUG ] && source $PLUG/*.plugin.zsh
done
