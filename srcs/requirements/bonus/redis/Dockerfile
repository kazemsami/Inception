FROM debian:buster

USER root

RUN apt update && apt install -y \
    redis

ENTRYPOINT ["redis-server"]