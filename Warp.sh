#!/bin/bash

STATUS=$(warp-cli status | grep -Ei "Status update:|Connected|Disconnected" | tail -n 1)

if [[ $STATUS == *"Connected"* ]]; then
    echo "WARP сейчас включен. Выключаю..."
    warp-cli disconnect
    notify-send "WARP выключен ✖︎"
elif [[ $STATUS == *"Disconnected"* ]]; then
    echo "WARP сейчас выключен. Включаю..."
    warp-cli connect
    notify-send "WARP включен ✔︎"
else
    notify-send "Ошибка: Не удалось определить статус."
    exit 1
fi
