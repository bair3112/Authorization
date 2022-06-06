include .env

.DEFAULT_GOAL: init

.PHONY: init
init: build config dependencies up

.PHONY: build
build:
	docker build . -t php:8.1-alpine --target=dev

.PHONY: config
config:
	cp .env.dist .env
	cp docker-compose.dist.yaml docker-compose.yaml

.PHONY: dependencies
dependencies: up
	docker-compose exec -e XDEBUG_MODE=off -u 1000:1000 -w /opt/authorization/app authorization composer install

.PHONY: up
up:
	docker-compose up -d

.PHONY: down
down:
	docker-compose down -v

.PHONY: sh
sh: up
	docker-compose exec -e XDEBUG_MODE=off -u 1000:1000 authorization bash

.PHONY: migrate
migrate:
	docker-compose exec -u 1000:1000 authorization \
		migrate \
			-path ./migrations/ \
			-database postgres://$(POSTGRES_USER):$(POSTGRES_PASSWORD)@$(POSTGRES_HOST):$(POSTGRES_PORT)/$(POSTGRES_DB)?sslmode=disable \
			up