APP_NAME=ffuf-docker
CONTAINER_TAG=1.5.0

all: build run

build:
	@echo '--- 🐳 Building container image...'
	docker build -t $(APP_NAME):$(CONTAINER_TAG) .
.PHONY: build

run:
	@echo '--- 🐳 Running container image...'
	docker run --rm $(APP_NAME):$(CONTAINER_TAG)
.PHONY: run

smoketest:
	@echo '--- 🐳 Running container smoke test...'
	docker run --rm $(APP_NAME):$(CONTAINER_TAG) -h
.PHONY: smoketest
