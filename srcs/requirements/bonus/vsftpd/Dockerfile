FROM debian:buster

USER root

ARG FTP_USER
ARG FTP_PASS

RUN apt-get update
RUN apt-get install -y \
	vsftpd \
	openssl

COPY ./requirements/bonus/vsftpd/conf/vsftpd.conf /etc/vsftpd.conf

RUN mkdir -p /var/run/vsftpd/empty

RUN useradd -m -p $(echo ${FTP_PASS} | openssl passwd -1 -stdin) ${FTP_USER}

ENTRYPOINT [ "vsftpd" ]
