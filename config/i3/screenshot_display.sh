#!/usr/bin/env bash

eval $(xdotool getmouselocation --shell)

mkdir -p $(xdg-user-dir PICTURES)/screenshots
IMG=$(xdg-user-dir PICTURES)/screenshots/$(date "+%s").png

xrandr | grep -Po '\d+x\d+.\d+.\d+' | while read monitor
do
  IFS=x+ read w h x y <<< $monitor
  (( x <= X && X <= x+w && y <= Y && Y <= y+h )) && \
	  maim -g $monitor -u $IMG && \
	  xclip -selection clipboard -t image/png -i $IMG
done

notify-send "Screenshot copied to clipboard" "You can find the screenshot at $IMG" -t 3000
