#!/bin/bash

case "$1" in
    volume)
        vol=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print int($2 * 100)}')
        icon="audio-volume-high"
        if [ "$vol" -lt 30 ]; then
            icon="audio-volume-low"
        elif [ "$vol" -eq 0 ]; then
            icon="audio-volume-muted"
        fi
        dunstify -i "$icon" -t 200 -h int:value:"$vol" "Volume" "🔊 $vol%" -h string:x-dunst-stack-tag:volume
        ;;
    brightness)
        bright=$(brightnessctl get)
        max_bright=$(brightnessctl max)
        percent=$((bright * 100 / max_bright))
        dunstify -i display-brightness -t 200 -h int:value:"$percent" "Brightness" "󰃞 $percent%" -h string:x-dunst-stack-tag:brightness
        ;;
esac
