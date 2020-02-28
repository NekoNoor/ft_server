# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: nschat <nschat@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2020/02/26 16:19:05 by nschat        #+#    #+#                  #
#    Updated: 2020/02/28 15:40:37 by nschat        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
MAINTAINER nschat <nschat@student.codam.nl>

RUN apt-get update && apt-get install -y \
	default-mysql-server \
	php-mysql \
	php-fpm \
	openssl \
	nginx \
	wget

WORKDIR /var/www/html
COPY srcs/start.sh .
COPY srcs/nginx.conf /etc/nginx/sites-available/localhost
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz && \
	tar xf phpMyAdmin-5.0.1-english.tar.gz && \
	rm -f phpMyAdmin-5.0.1-english.tar.gz && \
	mv phpMyAdmin-5.0.1-english phpmyadmin && \
	wget https://wordpress.org/latest.tar.gz && \
	tar xf latest.tar.gz && \
	rm -f latest.tar.gz && \
	mv wordpress/* . && \
	chmod -R 755 * && \
	chown -R www-data:www-data * && \
	ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost && \
	rm /etc/nginx/sites-enabled/default

EXPOSE 80 443
CMD ./start.sh && tail -f /dev/null
