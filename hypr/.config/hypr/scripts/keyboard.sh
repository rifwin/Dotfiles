#!/bin/bash

# device id of the keyboard backlight
deviceId='asus::kbd_backlight'

currBrightness() {
  brightnessctl --device=$deviceId get
}

case $@ in
  lightUp)
    brightnessctl --device=$deviceId s 10%+
    notify-send -t 1000 -u low "Keyboard Backlight $(currBrightness)"
    ;;
  lightDown)
    brightnessctl --device=$deviceId s 10%-
    notify-send -t 1000 -u low "Keyboard Backlight $(currBrightness)"
    ;;
  *)
    notify-send -t 1000 -u low "unknown args $@"
    ;;
esac

