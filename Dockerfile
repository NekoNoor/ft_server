# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Dockerfile                                         :+:    :+:             #
#                                                      +:+                     #
#    By: nschat <nschat@student.codam.nl>             +#+                      #
#                                                    +#+                       #
#    Created: 2020/02/26 16:19:05 by nschat        #+#    #+#                  #
#    Updated: 2020/02/28 16:50:46 by nschat        ########   odam.nl          #
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

# Download wordpress and install to /var/www/html
RUN wget https://wordpress.org/latest.tar.gz && \
	tar xf latest.tar.gz && \
	rm -f latest.tar.gz && \
	mv wordpress/* .

# Copy wordpress config
COPY srcs/wp-config.php .

# Set site as enabled and change permissions
COPY srcs/nginx.conf /etc/nginx/sites-available/localhost
RUN chmod -R 755 * && \
	chown -R www-data:www-data * && \
	ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost && \
	rm /etc/nginx/sites-enabled/default

# Initialize wordpress sql database
COPY srcs/new.sql .
RUN service mysql start && \
	mysql < new.sql

# Copy startup script
COPY srcs/start.sh .

# Expose port 80 and 443
EXPOSE 80 443

# Run the startup script and keep container running
CMD ./start.sh && tail -f /dev/null
