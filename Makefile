
COMPOSE := docker compose
RUN := $(COMPOSE) run --rm racket

.PHONY: setup test lint repl run

setup:
	$(COMPOSE) build

test:
	$(RUN) raco test sicp

lint:
	$(RUN) sh -c 'find sicp -name "*.rkt" -exec raco review {} \;'

repl:
	$(RUN) racket -i

run:
	@test -n "$(FILE)" || \
		(echo "Usage: make run FILE=sicp/chapter1/02.rkt"; exit 1)
	$(RUN) racket $(FILE)

