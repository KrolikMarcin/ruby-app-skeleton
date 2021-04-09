PROJECT_NAME   ?= app-skeleton

BUILD_TAG ?= build-local
VOLUMES   = /dummy

APP_IMAGE_TAG = $(PROJECT_NAME):$(BUILD_TAG)

ENVFILE = ./.env

export APP_IMAGE_TAG
export VOLUMES
export ENVFILE

build-api:
	docker build \
		--tag $(APP_IMAGE_TAG) \
		--target api \
		.

build: build-api

dev: build-api
	@ [ -e .env-development ] || cp -v .env .env-development
	VOLUMES=./source:/app \
	ENVFILE=./.env-development \
	docker-compose run --service-ports --rm service 'bash -l'

api: build-api
	@ [ -e .env-development ] || cp -v .env .env-development
	VOLUMES=./source:/app \
	ENVFILE=./.env-development \
	docker-compose run --service-ports --rm service 'bin/api'

clean:
	docker-compose down --remove-orphans --volumes