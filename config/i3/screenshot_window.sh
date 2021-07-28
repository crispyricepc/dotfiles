#!/bin/sh

DIR=$(xdg-user-dir PICTURES)/screenshots
mkdir -p $DIR
IMG=$DIR/$(date "+%s").png

maim -i $(xdotool getactivewindow) $IMG &&\
	xclip -selection clipboard -t image/png -i $IMG

notify-send "Screenshot copied to clipboard" "You can find the screenshot at $IMG" -t 3000
