#!/bin/bash

id=$(dunstify -p "Loading..." "Scanning for Wi-Fi networks...")

networks=$(nmcli -f BSSID,SSID,RATE,BARS,SECURITY,IN-USE dev wifi list | sed -n '1!p')

dunstctl close $id

chosen=$(echo -e "$networks" | wofi --dmenu --prompt "  Wi-Fi Networks" --width 1000 --height 500)

[[ -z "$chosen" ]] && exit

ssid=$(echo "$chosen" | awk '{print $1}')

nmcli device wifi connect "$ssid"
