setup: install

install:
	bundle install

test:
	bundle exec rake test

lint:
	bundle exec rubocop

.PHONY: test
