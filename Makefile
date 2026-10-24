setup:
	composer install

build:
	php bin/console site:build --env=prod && bin/write-redirects.sh

build-dev:
	php bin/console site:build && bin/write-redirects.sh

serve:
	php -S localhost:8000 -t build
