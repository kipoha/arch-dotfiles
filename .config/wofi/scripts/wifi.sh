#!/bin/bash

id=$(dunstify -p "Loading..." "Scanning for Wi-Fi networks...")

networks=$(nmcli -f SSID,SIGNAL,SECURITY device wifi list | awk 'NR>1 {print $1 "  (" $2 "%)"}' | sort -u)

dunstctl close $id

chosen=$(echo -e "$networks" | wofi --dmenu --prompt "  Wi-Fi Networks" --width 400 --height 600)

[[ -z "$chosen" ]] && exit

ssid=$(echo "$chosen" | awk '{print $1}')

nmcli device wifi connect "$ssid"
