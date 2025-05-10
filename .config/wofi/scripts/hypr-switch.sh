#!/bin/bash

titles_and_addrs=$(hyprctl clients -j | jq -r '.[] | "[\(.class)] :: \(.title) (ws: \(.workspace.id)) @\(.address)\t\(.address)"')

chosen_line=$(echo "$titles_and_addrs" | cut -f1 | wofi --dmenu --style ~/.config/wofi/other.css --location center --width=1200 --height=500)

addr=$(echo "$titles_and_addrs" | grep -F "$chosen_line" | cut -f2)

if [[ -n "$addr" ]]; then
    hyprctl dispatch focuswindow address:$addr
fi
