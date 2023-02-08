FROM debian:buster

ARG FTP_USER
ARG FTP_PASS

USER root

RUN apt-get update && apt-get install -y \
    vsftpd

COPY ./requirements/bonus/vsftpd/conf/vsftpd.conf /etc/vsftpd/

RUN mkdir -p /var/run/vsftpd/empty

RUN useradd -m -p $(echo ${FTP_PASS} | openssl passwd -1 -stdin) kabusitt && \
    echo ${FTP_USER} | tee -a /etc/vsftpd.userlist && \
    usermod -aG www-data ${FTP_USER}

ENTRYPOINT ["vsftpd"]