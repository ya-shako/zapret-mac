FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    iproute2 net-tools iptables \
    curl git sudo nftables \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root
RUN git clone https://github.com/Sergeydigl3/zapret-discord-youtube-linux.git

CMD ["bash", "-c", "cd /root/zapret-discord-youtube-linux && sudo bash main_script.sh"]