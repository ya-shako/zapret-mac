FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    iproute2 net-tools iptables \
    iputils-ping dnsutils curl wget \
    python3 python3-pip python3-dev \
    sudo git tcpdump \
    libnetfilter-queue-dev build-essential \
    nftables \
    && rm -rf /var/lib/apt/lists/*

# Клонируем zapret при сборке
WORKDIR /root
RUN git clone https://github.com/Sergeydigl3/zapret-discord-youtube-linux.git

COPY start.sh /root/start.sh
RUN chmod +x /root/start.sh

# Запускаем наш скрипт вместо bash
CMD ["/root/start.sh"]