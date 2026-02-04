#!/bin/bash

echo "Сборка Docker образа..."
docker build -t discord-bypass .

echo "Запуск контейнера..."
docker run -d \
  --name discord-bypass \
  --cap-add=NET_ADMIN \
  --cap-add=NET_RAW \
  --sysctl net.ipv4.ip_forward=1 \
  -p 1080:1080 \
  -p 53:53/udp \
  discord-bypass

echo "Контейнер запущен в фоне"
echo "Логи: docker logs discord-bypass -f"