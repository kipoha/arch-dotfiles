#!/bin/bash

# options=" Lock\n⏻ Power Off\n󰜉 Reboot\n󱖒 Suspend\n󰤄 Hibernate\n󰈆 Exit"
options="\n⏻\n󰜉\n󱖒\n󰤄\n󰈆"

selected=$(echo -e "$options" | wofi --dmenu --style ~/.config/wofi/power.css --location right --width=47 --height=330)
case "$selected" in
  # "⏻ Power Off")
  "⏻")
    systemctl poweroff
    ;;
  # "󰜉 Reboot")
  "󰜉")
    systemctl reboot
    ;;
  # "󰤄 Hibernate")
  "󰤄")
    systemctl hibernate
    ;;
  # "󰈆 Exit")
  "󰈆")
    hyprctl dispatch exit
    ;;
  # " Lock")
  "")
    ~/.config/hypr/scripts/lock_with_date.sh
    ;;
  # "󱖒 Suspend")
  "󱖒")
    systemctl suspend
    ;;
  *)
    exit 0
    ;;
esac
