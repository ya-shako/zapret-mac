#!/bin/bash

cd /root/zapret-discord-youtube-linux

echo "=== Запуск на порту ${PROXY_PORT:-11080} ==="

echo "=== Установка и настройка zapret ==="

# Запускаем авто-подбор стратегий
echo "Запуск auto_tune_youtube.sh..."
echo "1" | sudo bash auto_tune_youtube.sh

echo "=== Запуск основной службы ==="

# Автоматический запуск с первой рабочей стратегией
INTERFACE=$(ip route | grep default | awk '{print $5}' | head -n 1)
[ -z "$INTERFACE" ] && INTERFACE="eth0"

# Используем стандартную стратегию
cat > conf.env << EOF
strategy=general.bat
interface=$INTERFACE
gamefilter=true
auto_update=false
EOF

sudo bash main_script.sh -nointeractive

echo "✅ Zapret запущен!"
echo "📡 Контейнер готов к работе"

# Держим контейнер активным
sleep infinity