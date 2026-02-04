#!/bin/bash

echo "=== Запуск простого SOCKS5 прокси ==="

# Запускаем tpws в режиме SOCKS прокси
/usr/local/bin/tpws --socks --port 1080 --bind-addr 0.0.0.0 &

echo "✅ SOCKS5 прокси запущен на порту 1080"
echo "На Mac используйте: 127.0.0.1:11080"

# Держим контейнер активным
wait