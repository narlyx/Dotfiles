#!/usr/bin/env sh
# Take a screenshot on Hyprland using hyprctl, jq, grim, slurp, and swappy
#
# Make sure the script is executable (chmod +x ./screenshot.sh)
#
# Example Hyprland configuration (add to your hyprland.conf):
#
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
esac
