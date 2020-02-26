# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: nschat <nschat@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2020/02/26 16:19:05 by nschat        #+#    #+#                  #
#    Updated: 2020/02/26 17:18:57 by nschat        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
MAINTAINER nschat <nschat@student.codam.nl>

RUN apt-get update && apt-get install -y \
	default-mysql-server \
	php-mysql \
	xz-utils \
	php-fpm \
	openssl \
	nginx \
	wget

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz && \
	tar xf phpMyAdmin-5.0.1-english.tar.gz && \
	rm -f phpMyAdmin-5.0.1-english.tar.gz && \
	mv phpMyAdmin-5.0.1-english phpMyAdmin

RUN wget https://wordpress.org/latest.tar.gz && \
	tar xf latest.tar.gz && \
	rm -f latest.tar.gz && \
	mv wordpress WordPress

COPY srcs/start.sh .

CMD bash start.sh
