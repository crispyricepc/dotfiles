#!/bin/sh

mkdir -p $(xdg-user-dir PICTURES)/screenshots
IMG=$(xdg-user-dir PICTURES)/screenshots/$(date "+%s").png

maim --select $IMG &&\
	xclip -selection clipboard -t image/png -i $IMG

notify-send "Screenshot copied to clipboard" "You can find the screenshot at $IMG" -t 3000
