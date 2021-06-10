FROM wordpress

# use the db.php for sqlite db
COPY db.php /usr/src/wordpress/wp-content/

# copy wp-config.php to skip database setting on set-up
COPY config/wp-config.php /var/www/wp-config.php
RUN chown www-data:www-data /var/www/wp-config.php

# Download the static build of Litestream directly into the path & make it executable.
# This is done in the builder and copied as the chmod doubles the size.
ADD https://github.com/benbjohnson/litestream/releases/download/v0.3.5/litestream-v0.3.5-linux-amd64-static.tar.gz /tmp/litestream.tar.gz
RUN tar -C /usr/local/bin -xzf /tmp/litestream.tar.gz

RUN mkdir -p /data
RUN chown www-data:www-data /data

COPY litestream.yml /etc/litestream.yml

# TODO DELETE WHEN DONE
COPY secrets/google-creds.json /etc/google-creds.json
ENV GOOGLE_APPLICATION_CREDENTIALS=/etc/google-creds.json

COPY entrypoint.sh /scripts/entrypoint.sh

RUN chown www-data:www-data /scripts/entrypoint.sh
RUN chmod 766 /scripts/entrypoint.sh

CMD ["/scripts/entrypoint.sh"]
