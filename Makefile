.PHONY: setup build build-dev serve

setup:
	composer install

build:
	php bin/console site:build --no-drafts

build-dev:
	php bin/console site:build

serve:
	php -S localhost:8000 -t build
