#!/bin/bash

# device id of the monitor
deviceId="intel_backlight" 

currBrightness() {
  brightnessctl --device=$deviceId get
}

case $@ in
  lightUp)
    brightnessctl --device=$deviceId s 10%+
    notify-send -t 1000 -u low "Monitor Brightness $(currBrightness)"
    ;;
  lightDown)
    brightnessctl --device=$deviceId s 10%-
    notify-send -t 1000 -u low "Monitor Brightness $(currBrightness)"
    ;;
  toggle)
    notify-send -t 1000 -u low "Monitor Turned Off"
    sleep 1 && hyprctl dispatch dpms toggle
    ;;
  *)
    notify-send "unknown args $@" -t 1000 -u low
    ;;
esac

