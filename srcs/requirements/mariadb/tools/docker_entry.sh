#!/usr/bin/env bash

rm -rf /var/lib/mysql/*

echo >> /etc/mysql/my.cnf
echo "[mysqld]" >> /etc/mysql/my.cnf
echo "bind-address=0.0.0.0" >> /etc/mysql/my.cnf

mysql_install_db --datadir=/var/lib/mysql

mysqld_safe &
mysql_pid=$!

until mysqladmin ping >/dev/null 2>&1; do
  echo -n "."; sleep 0.2
done

mysql -u root -e "CREATE DATABASE wordpress;
    GRANT ALL ON wordpress.* TO 'kabusitt'@'%' IDENTIFIED BY 'hello123'; FLUSH PRIVILEGES;"

wait $mysql_pid