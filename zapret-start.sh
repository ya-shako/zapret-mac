#!/bin/bash
# zapret-start.sh

echo "Очистка..."
docker rm -f discord-zapret 2>/dev/null

echo "Запуск контейнера..."
docker run -d \
  --name discord-zapret \
  --cap-add=NET_ADMIN \
  --cap-add=NET_RAW \
  --network=host \
  ubuntu:22.04 \
  tail -f /dev/null

echo "Готово! Зайди в контейнер:"
echo "docker exec -it discord-zapret bash"