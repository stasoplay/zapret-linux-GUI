ZAPRET_PATH="/opt/zapret"
check_warp() { 
    command -v warp-cli >/dev/null 2>&1 && warp-cli status 2>/dev/null | grep -q "Connected"
    return $?
}

check_zapret() { 
    pgrep -f "tpws|nfqws|dvtws" > /dev/null
    return $?
}

while true; do
    if check_warp; then
        warp_status="<span foreground='green' size='large'>WARP: ЗАПУЩЕН ✓</span>"
    else
        warp_status="<span foreground='red' size='large'>WARP: НЕ ЗАПУЩЕН ✗</span>"
    fi
    
    if check_zapret; then
        zapret_status="<span foreground='green' size='large'>Zapret: ЗАПУЩЕН ✓</span>"
    else
        zapret_status="<span foreground='red' size='large'>Zapret: НЕ ЗАПУЩЕН ✗</span>"
    fi
    
    yad --info \
        --text-align=center \
        --title="Статус сервисов" \
        --text="$warp_status\n\n$zapret_status" \
        --button="Обновить:0" \
        --button="Закрыть:1" \
        --width=200 \
        --height=200 \
        --center
    
    exit_code=$?
    if [ $exit_code -eq 1 ] || [ $exit_code -eq 252 ]; then
        break
    fi
    sleep 1
done
