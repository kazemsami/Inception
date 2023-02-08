FROM debian:buster

USER root

RUN apt update && apt install -y \
	wget \
	curl \
	sendmail \
	php-mysql \
	php \
	php-fpm && \
	mkdir -p /run/php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY ./requirements/bonus/wordpress/conf/www.conf /etc/php/7.3/fpm/pool.d/

COPY ./requirements/bonus/wordpress/tools/docker_entry.sh /usr/local/bin/

COPY ./requirements/bonus/wordpress/conf/wp-config.php /tmp/

ENTRYPOINT ["docker_entry.sh"]