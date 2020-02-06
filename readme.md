# docker-compose config for Squiz Matrix CMS

## What is it?

A docker-compose configuration to quickly run up an instance of Squiz Matrix CMS:

* Suports Matrix 5.5.3.0+ (last tested with 5.5.5.1)
* PHP 7.3 with V8js support
* Postgres DB container
* Redis session storage
* Supports automatic installation of extensions on startup
* Cut down "core" Matrix with old extensions removed
  * bulkmail
  * ecommerce
  * ldap
  * marketo
  * sharepoint
  * sugar
  * trim
 
## tl;dr
 
```bash
git clone git@github.com:cjc/composed-matrix.git
cd compose-matrix

#set up environment variables for port and domain
echo HTTP_PORT=81 > .env
echo MATRIX_URL=127.0.0.1:81 >> .env

#download Matrix source tgz to php/src/
lynx https://matrix.squiz.net/releases/vm

docker-compose up -d
docker-compose logs -f

#Wait for installation to complete, should see "NOTICE: ready to handle connections"
lynx 127.0.0.1:81/_admin
```

## Containers

* webserver - based on `nginx`
* application - based on `gytist/php-fpm-v8js`
* database - based on `postgres:latest`
* session storage - `redis`

## Extension support

Matrix extensions from https://marketplace.squiz.net/extensions can be installed by dropping the tgz file into `php/src/packages`. Tested with Content API and JSON Web Token.
