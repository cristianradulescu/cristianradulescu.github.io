serve:
	docker run --rm -v $(shell pwd):/srv/jekyll -it -p 4000:4000 jekyll/jekyll:3.8 jekyll serve

update:
	docker run --rm -v $(shell pwd):/srv/jekyll -it jekyll/jekyll:3.8 bundle update

install:
	docker run --rm -v $(shell pwd):/srv/jekyll -it jekyll/jekyll:3.8 bundle install