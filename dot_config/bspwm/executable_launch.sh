#! /bin/sh

sxhkd &
dunst &
picom &
feh --bg-fill ~/Pictures/wallpapers/mountain.jpg

killall -q polybar

for m in $(polybar --list-monitors | cut -d":" -f1); do
	MONITOR=$m polybar --config=~/.config/polybar/kuroi/config.ini kuroi &
done
