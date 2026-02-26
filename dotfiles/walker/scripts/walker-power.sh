items=" Lock\n󰒲 Suspend\n󰈆 Log out\n Reboot\n Shut down"
output=$(echo -e $items | walker --dmenu -n)
if [[ "$output" == " Lock" ]]; then
    swaylock -f
elif [[ "$output" == "󰒲 Suspend" ]]; then
    swaylock -f &
    sleep 1
    systemctl suspend
elif [[ "$output" == "󰈆 Log out" ]]; then
    gnome-session-quit --logout --no-prompt
elif [[ "$output" == " Reboot" ]]; then
    sudo reboot
elif [[ "$output" == " Shut down" ]]; then
    sudo shutdown now
else
    echo "Select excecution"
fi
