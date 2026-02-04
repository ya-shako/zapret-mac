FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    iproute2 curl wget git python3 \
    dante-server \
    && rm -rf /var/lib/apt/lists/*

# Устанавливаем простой SOCKS5 сервер
RUN wget https://raw.githubusercontent.com/Sergeydigl3/zapret-discord-youtube-linux/main/tpws -O /usr/local/bin/tpws && \
    chmod +x /usr/local/bin/tpws

COPY start-socks.sh /root/start-socks.sh
RUN chmod +x /root/start-socks.sh

CMD ["/root/start-socks.sh"]