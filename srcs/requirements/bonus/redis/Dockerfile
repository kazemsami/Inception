FROM debian:buster

USER root

RUN apt update && apt install -y \
    redis

COPY ./requirements/bonus/redis/conf/redis.conf /etc/redis/redis.conf

ENTRYPOINT [ "redis-server", "/etc/redis/redis.conf" ]