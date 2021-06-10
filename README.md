# wp-litestream-docker
**WORK IN PROGRESS**

Goal: Dockerfile to run with SQLite integration + litestream integration enabled

Current state:
- Wordpress is running with the SQLite plugin in Docker (with https://github.com/aaemnnosttv/wp-sqlite-db db.php file)
  - needed to have the `wp-config.php` copied instead of running after copying `db.php`. WP still tried to connect to a MySQL DB
- Uses `wordpress` as the base image to not need nginx image to serve. Might be able to add it in here
- integrated litestream with https://github.com/benbjohnson/litestream-docker-example as reference
  - SQLite <-> WP works well on volume mounting. Doesn't work on no-volume-mount

Next steps:
- add media upload to s3/gcs too (WP Offload Media Lite?)

How to run:
- clone this repo
- `docker build -t wp-litestream-docker:latest . && docker run -p 8080:80 --rm -v ${PWD}:/data -e REPLICA_URL=s3://YOURBUCKETNAME/db -e LITESTREAM_ACCESS_KEY_ID -e LITESTREAM_ACCESS_KEY wp-litestream-docker`
- open `localhost:8080` to start installation

Other Goals:
- run on wordpress:alpine for a lighter image -- needs fpm. Probably keeping this base
- how to customize theme/settings easily. Another repo to host the customized Dockerimage? maybe.
- Personal: somehow automate WP -> static site. Either in here / with plugin / other process
