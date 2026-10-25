setup:
	composer install

build:
	php bin/console site:build --env=prod

build-dev:
	php bin/console site:build

serve:
	php -S localhost:8000 -t build
