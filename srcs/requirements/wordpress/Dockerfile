FROM debian:10

RUN apt -y update && apt install -y php-fpm

EXPOSE 9000

CMD service php7.3-fpm start && service php7.3-fpm stop && php-fpm7.3 -D

