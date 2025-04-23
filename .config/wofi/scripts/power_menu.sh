#!/bin/bash

options=" Lock\n⏻ Power Off\n󰜉 Reboot\n󱖒 Suspend\n󰤄 Hibernate\n󰈆 Exit"

selected=$(echo -e "$options" | wofi --dmenu --style ~/.config/wofi/power.css --width=170 --height=260)
case "$selected" in
  "⏻ Power Off")
    systemctl poweroff
    ;;
  "󰜉 Reboot")
    systemctl reboot
    ;;
  "󰤄 Hibernate")
    systemctl hibernate
    ;;
  "󰈆 Exit")
    hyprctl dispatch exit
    ;;
  " Lock")
    hyprlock
    ;;
  "󱖒 Suspend")
    systemctl suspend
    ;;
  *)
    exit 0
    ;;
esac
