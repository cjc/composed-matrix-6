# docker-compose config for Squiz Matrix CMS version 6

## Disclaimer

This fairly shonky and intended for internal test and dev servers only. Do not use in production. This repo is for Squiz Matrix 6. For 5.5 use https://github.com/cjc/composed-matrix

## What is it?

A docker-compose configuration to quickly run up an instance of Squiz Matrix CMS:

* Suports Matrix 6.15+ (last tested with 6.15)
* PHP 7.3 with V8js support
* Postgres DB container
* Redis session storage
* Supports automatic installation of extensions on startup
* Cut down "core" Matrix with old extensions removed
  * bulkmail
  * ecommerce
  * ~~ldap~~ (Not removed for V6 because the new `application_monitoring` package depends on it
  * marketo
  * sharepoint
  * ~~sugar~~ (Not removed anymore because User has a hard dependency on it :disappointed:)
  * trim
 
## tl;dr
 
```bash
git clone git@github.com:cjc/composed-matrix-6.git

cd composed-matrix-6

./tldr.sh
```

## Application code

This repo doesn't contain the code for Matirx, you need to download it and any extensions you want.

For version 6 you'll need to extract and run `npm install && npm run build`

```
php/src/source/...
php/src/packages/json_web_token.tgz
php/src/packages/dropinapps_connector-1.0.3.tgz
php/src/packages/data_search.tgz
php/src/packages/content_api.tgz
```

## Extension support

Matrix extensions from https://marketplace.squiz.net/extensions can be installed by dropping the tgz file into `php/src/packages`. Tested with Content API and JSON Web Token.

## Containers

* webserver - based on `nginx`
* application - based on `nkahoang/docker-v8js-php:php7.3-fpm-v8js7.9`
* database - based on `postgres:latest`
* session storage - `redis`
