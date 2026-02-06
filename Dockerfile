FROM ubuntu:latest 


COPY requiriments.txt .
RUN apt-get update && \
    xargs apt-get install -y < requiriments.txt

ENTRYPOINT git clone https://github.com/Sergeydigl3/zapret-discord-youtube-linux.git && \
    cd zapret-discord-youtube-linux && \
    sudo bash main_script.sh





