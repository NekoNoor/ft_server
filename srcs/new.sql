CREATE DATABASE wordpress;
CREATE DATABASE phpmyadmin;
GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost';
GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'root'@'localhost';
FLUSH PRIVILEGES;
UPDATE mysql.user SET plugin = 'mysql_native_password' WHERE user='root';
