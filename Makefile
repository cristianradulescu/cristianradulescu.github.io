setup:
	composer install && npm install --legacy-peer-deps && npm run dev

build:
	vendor/bin/jigsaw build

serve:
	vendor/bin/jigsaw serve

watch:
	yarn watch
