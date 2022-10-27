#!/usr/bin/env bash
set -Eeuo pipefail
user='www-data'
group='www-data'
echo >&2 "Copying wordpress..."
tar --create --file - --directory /usr/src/wordpress --owner \
"$user" --group "$group" . | tar --extract --file -
echo >&2 "Successfully copied wordpress to volume"

exec /usr/local/php7/sbin/php-fpm