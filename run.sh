#!/bin/bash

echo "Сборка Docker образа..."
docker build -t discord-bypass .

echo "Запуск контейнера (порт 11080)..."
docker run -d \
  --name discord-bypass \
  --cap-add=NET_ADMIN \
  --cap-add=NET_RAW \
  --sysctl net.ipv4.ip_forward=1 \
  -p 11080:1080 \
  discord-bypass

echo "✅ Контейнер запущен!"
echo "📌 Настройте на Mac:"
echo "   SOCKS5 прокси: 127.0.0.1:11080"