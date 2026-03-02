items=" | Lock\n󰒲 | Suspend\n󰈆 | Log out\n | Reboot\n | Shut down"
output=$(echo -e $items | walker --dmenu -n)
if [[ "$output" == " | Lock" ]]; then
    swaylock -f -C ~/.config/swaylock/config
elif [[ "$output" == "󰒲 | Suspend" ]]; then
    swaylock -f -C ~/.config/swaylock/config &
    sleep 1
    systemctl suspend
elif [[ "$output" == "󰈆 | Log out" ]]; then
    niri msg action quit
elif [[ "$output" == " | Reboot" ]]; then
    reboot
elif [[ "$output" == " | Shut down" ]]; then
    sudo shutdown now
else
    echo "Select excecution"
fi
