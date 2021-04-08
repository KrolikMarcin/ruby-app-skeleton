PROJECT_NAME   ?= app-skeleton

BUILD_TAG ?= build-local
VOLUMES   = /dummy

API_IMAGE_TAG = $(PROJECT_NAME):$(BUILD_TAG)

ENVFILE = ./.env

export API_IMAGE_TAG
export VOLUMES
export ENVFILE

build-api:
	docker build \
		--tag $(API_IMAGE_TAG) \
		.

build: build-api

dev: build-api
	@ [ -e .env-development ] || cp -v .env .env-development
	VOLUMES=./source:/app \
	ENVFILE=./.env-development \
	docker-compose run --service-ports --rm service 'bash -l'

clean:
	docker-compose down --remove-orphans --volumes