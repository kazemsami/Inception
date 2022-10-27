FROM debian:10

USER root

RUN apt update && apt install git build-essential make autoconf re2c bison libxml2-dev wget -y

RUN apt install libssl-dev pkg-config zlib1g-dev libsodium-dev libcurl4-openssl-dev libbz2-dev libpng++-dev libzip-dev -y

RUN wget https://www.php.net/distributions/php-7.3.11.tar.gz && \
    mkdir -p /usr/src/php && \
    tar xfz php-7.3.11.tar.gz -C /usr/src/php && \
    cd /usr/src/php/php-7.3.11 && \
    ./configure \
	--prefix=/usr/local/php7 \
	--with-config-file-path=/usr/local/php7/etc \
	--with-config-file-scan-dir=/usr/local/php7/etc/conf.d \
	--enable-bcmath \
	--with-bz2 \
	--with-curl \
	--enable-filter \
	--enable-fpm \
	--with-gd \
	--enable-intl \
	--enable-mbstring \
	--enable-mysqlnd --with-mysql-sock=/var/lib/mysql/mysql.sock --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd \
	--with-pdo-sqlite \
	--disable-phpdbg --disable-phpdbg-webhelper \
	--enable-opcache \
	--with-openssl \
	--enable-simplexml \
	--with-sqlite3 \
	--enable-xmlreader --enable-xmlwriter \
	--enable-zip \
	--with-zlib \
    --disable-cgi \
	--with-fpm-user=www-data --with-fpm-group=www-data && \
    make -j 4 && \
    make install

RUN cd /usr/local/php7/etc; \
    sed 's!=NONE/!=!g' php-fpm.conf.default >> php-fpm.conf; \
    cp php-fpm.d/www.conf.default php-fpm.d/www.conf; \
	{ \
		echo '[global]'; \
		echo 'error_log = /proc/self/fd/2'; \
		echo; \
	} >> php-fpm.d/docker.conf; \
	{ \
		echo '[global]'; \
		echo 'daemonize = no'; \
		echo; \
		echo '[www]'; \
		echo 'listen = 9000'; \
	} >> php-fpm.d/zz-docker.conf

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz && \
    cp -r wordpress /usr/src/

WORKDIR /var/www/html

COPY ./requirements/wordpress/tools/docker_entry.sh /usr/local/bin/

ENTRYPOINT ["docker_entry.sh"]