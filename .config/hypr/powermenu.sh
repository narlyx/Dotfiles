#!/bin/bash

entries="Logout\nSuspend\nReboot\nShutdown"

selected=$(echo -e $entries|wofi --width 250 --height 210 --dmenu)

case $selected in
  Logout)
    hyprctl dispatch exit;;
  Suspend)
    exec systemctl suspend;;
  Reboot)
    exec systemctl reboot;;
  Shutdown)
    exec systemctl poweroff -i;;
esac

echo $selected
