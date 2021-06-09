# wp-litestream-docker
**WORK IN PROGRESS**

Goal: Dockerfile to run with SQLite integration + litestream integration enabled

Current state:
- Wordpress is running with the SQLite plugin in Docker (with https://github.com/aaemnnosttv/wp-sqlite-db db.php file)
  - needed to have the `wp-config.php` copied instead of running after copying `db.php`. WP still tried to connect to a MySQL DB
- Uses `wordpress` as the base image to not need nginx image to serve. Might be able to add it in here

Next steps:
- integrate streamlite with https://github.com/benbjohnson/litestream-s6-example as reference
- add the streamlite configuration.. somewhere

How to run:
- clone this repo
- `docker build -t wp-litestream-docker:latest . && docker run -p 8080:80 --rm wp-litestream-docker`
- open `localhost:8080` to start installation

Other Goals:
- run on wordpress:alpine for a lighter image
- Personal: somehow automate WP -> static site. Either in here / with plugin / other process
