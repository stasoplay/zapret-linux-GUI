#Указыйте путь правильно
export PATH="$PATH:$HOME/zapret-linux-GUI/"
export IMG_PATH="$HOME/zapret-linux-GUI/"

yad --title="Мой пульт управления" \
    --text-align=center \
    --text="Выберите действие:" \
    --button="Запустить/отключить Warp"!browser!:"Warp.sh" \
    --button="Запустить/отключить zapret"!terminal!:"bash -c zapret.sh" \
    --button="Проверить Warp и Zapret"!dialog-information!:"bash -c Check.sh" \
    --buttons-layout=center \
    --picture \
    --size=fit \
    --filename="$IMG_PATH/Image.png" \
