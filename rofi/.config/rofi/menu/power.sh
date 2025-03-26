#!/bin/sh

themeDir="$HOME/.config/rofi/themes/power.rasi"

shutdown="󰐥"
reboot="󰜉"
sleep="󰤄"
logout="󰈆"

selection=$(echo -e "$shutdown\n$reboot\n$sleep\n$logout" |\
  rofi -dmenu\
  -theme $themeDir\
  -mesg "Power Options"
)

confirmCmd() {
  echo -e "Yes\nNo" | rofi -dmenu -theme $themeDir -mesg "Are You Sure ?"
}

case "$selection" in
    $shutdown)
        confirmVar=$(confirmCmd)
        if [ "$confirmVar" = "Yes" ]; then 
          echo "Shutdown Yes"
        fi
        ;;
    $reboot)
        confirmVar=$(confirmCmd)
        if [ "$confirmVar" = "Yes" ]; then 
          echo "Reboot Yes"
        fi
        ;;
    $sleep)
        echo "Sleep"
        ;;
    $logout)
        echo "Logout"
        ;;
    *)
        echo "Invalid option"
        ;;
esac


