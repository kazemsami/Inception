FROM debian:buster

RUN apt-get update && apt-get install -y \
    curl

RUN curl -sSL https://github.com/google/cadvisor/releases/download/v0.47.0/cadvisor-v0.47.0-linux-amd64 -o /usr/bin/cadvisor && \
    chmod +x /usr/bin/cadvisor

ENTRYPOINT ["/usr/bin/cadvisor"]