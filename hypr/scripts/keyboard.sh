#!/bin/bash

# Device ID of the keyboard backlight
deviceId='asus::kbd_backlight'

percentBright() {
  currBright=$(brightnessctl --device="$deviceId" get)
  maxBright=$(brightnessctl --device="$deviceId" max)

  # Use bc for percentage calculation
  percent=$(echo "scale=2; $currBright / $maxBright * 100" | bc)
  
  echo "$percent"
}

case $1 in
  lightUp)
    brightnessctl --device="$deviceId" s 10%+
    percent=$(percentBright) # Call the function and capture its output
    notify-send -t 1000 -u low "Keyboard Backlight: $percent%"
    ;;
  lightDown)
    brightnessctl --device="$deviceId" s 10%-
    percent=$(percentBright) # Call the function and capture its output
    notify-send -t 1000 -u low "Keyboard Backlight: $percent%"
    ;;
  *)
    notify-send -t 1000 -u low "Unknown argument: $1"
    ;;
esac
