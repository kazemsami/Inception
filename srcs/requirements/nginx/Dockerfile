FROM debian:10

RUN apt -y update && apt install -y nginx && apt upgrade -y openssl && mkdir /etc/nginx/certificates && \
	openssl req \
		-x509 \
		-newkey rsa:2048 \
		-keyout /etc/nginx/certificates/key.pem \
		-out /etc/nginx/certificates/cert.pem \
		-days 365 \
		-nodes \
		-subj /CN=localhost

COPY ./requirements/nginx/conf/default.conf /etc/nginx/sites-available/default

EXPOSE 80 443

CMD nginx -g 'daemon off;'