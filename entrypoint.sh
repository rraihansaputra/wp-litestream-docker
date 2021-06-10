set -e

# Restore the database if it does not already exist.
if [ -f /data/db ]; then
	echo "Database already exists, skipping restore"
else
	echo "No database found, restoring from replica if exists"
	litestream restore -v -if-replica-exists -o /data/db "${REPLICA_URL}"
fi

# Run litestream with your app as the subprocess.
# docker-entrypoint.sh is copied by the wordpress base image and set as the ENTRYPOINT
# apache2-foreground is the default CMD
exec litestream replicate -exec "docker-entrypoint.sh apache2-foreground"
