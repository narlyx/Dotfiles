#!/bin/sh
# bind = , Print, exec, ~/.config/hypr/screenshot.sh region
# bind = SHIFT, Print, exec, ~/.config/hypr/screenshot.sh window
# bind = CTRL, Print, exec, ~/.config/hypr/screenshot.sh output
# bind = CTRL SHIFT, Print, exec, ~/.config/hypr/screenshot.sh all

# region|window|output|all
mode="$1"

case $mode in
"region")
	grim -g "$(slurp)" - | swappy -f -
	;;
"window")
	grim -g "$(hyprctl activewindow -j | jq -j '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')" - | swappy -f -
	;;
"output")
	grim -o "$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .name')" - | swappy -f -
	;;
"all")
	grim - | swappy -f -
	;;
*)
	echo >&2 "unsupported command \"$mode\""
	echo >&2 "Usage:"
	echo >&2 "screenshot.sh <region|window|output|all>"
	exit 1
	;;
esac
