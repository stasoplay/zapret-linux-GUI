export PATH="$PATH:$HOME/zapret-linux-GUI/"

choice=$(yad --list --title="Настройка Zapret" --width=400 --height=300 \
    --column="№" --column="Действие" \
    "1" "Удалить/Установить в Автозагрузку" \
    "2" "Запустить/Остановить service" \
    "3" "Перезагрузить zapret" \
    "4" "Редактировать конфиг")

[ -z "$choice" ] && exit 0

item=$(echo "$choice" | cut -d'|' -f1)

if [ -n "$item" ] && [ "$item" != "4" ]; then
    echo "$item" | pkexec service.sh | yad --text-info --width=600 --height=400
fi

if [ "$item" = "4" ]; then

    #Поиск терминала
    if command -v gnome-terminal >/dev/null 2>&1; then
        gnome-terminal -- bash -c "pkexec service.sh; exec bash"
    elif command -v alacritty >/dev/null 2>&1; then
        alacritty --hold -e pkexec service.sh
    elif command -v kitty >/dev/null 2>&1; then
        kitty --hold sh -c "pkexec service.sh"
    elif command -v xterm >/dev/null 2>&1; then
        xterm -hold -e "pkexec /service.sh"
    elif command -v konsole >/dev/null 2>&1; then
        konsole --hold -e pkexec ./App/zapret/service.sh
    elif command -v terminator >/dev/null 2>&1; then
        terminator --hold -e "pkexec service.sh"
    else
        x-terminal-emulator -e "pkexec service.sh"
    fi

fi
