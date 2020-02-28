# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: nschat <nschat@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2020/02/26 16:19:05 by nschat        #+#    #+#                  #
#    Updated: 2020/02/28 17:19:10 by nschat        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
MAINTAINER nschat <nschat@student.codam.nl>

# Install required packages
RUN apt-get update && apt-get install -y \
	default-mysql-server \
	php-mysql \
	php-fpm \
	openssl \
	nginx \
	wget

# Set workdir to the right location
WORKDIR /var/www/html

# Download phpmyadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz && \
	tar xf phpMyAdmin-5.0.1-english.tar.gz && \
	rm -f phpMyAdmin-5.0.1-english.tar.gz && \
	mv phpMyAdmin-5.0.1-english phpmyadmin

# Copy phpmyadmin config
COPY srcs/config.inc.php ./phpmyadmin

# Download wordpress and install to /var/www/html
RUN wget https://wordpress.org/latest.tar.gz && \
	tar xf latest.tar.gz && \
	rm -f latest.tar.gz && \
	mv wordpress/* .

# Copy wordpress config and database
COPY srcs/wp-config.php .
COPY srcs/wordpress.sql .

# Initialize wordpress sql database
COPY srcs/new.sql .
RUN service mysql start && \
	mysql < new.sql && \
	mysql wordpress -u root --password=  < wordpress.sql

# Set site as enabled and change permissions
COPY srcs/nginx.conf /etc/nginx/sites-available/localhost
RUN chmod -R 755 * && \
	chown -R www-data:www-data * && \
	ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost && \
	rm /etc/nginx/sites-enabled/default && \
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj '/C=NL/ST=Noord-Holland/L=Amsterdam/O=Codam/CN=123' -keyout /etc/ssl/certs/localhost.key -out /etc/ssl/certs/localhost.crt

# Copy startup script
COPY srcs/start.sh .

# Expose port 80 and 443
EXPOSE 80 443

# Run the startup script and keep container running
CMD ./start.sh && tail -f /dev/null
