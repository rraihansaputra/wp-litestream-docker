FROM wordpress

COPY db.php /usr/src/wordpress/wp-content/

COPY config/wp-config.php /var/www/wp-config.php
RUN chown www-data:www-data /var/www/wp-config.php
