docker_tag 	= nyxmo/ipxe-boot-defaults
docker_name 	= ipxe-boot-defaults

UNAME_S        := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
    APP_HOST   := localhost
endif
ifeq ($(UNAME_S),Darwin)
    APP_HOST   := $(shell docker-machine ip default)
endif

build:
	docker build -t $(docker_tag) -name $(docker_name) .

bash:
	docker run --rm -it $(docker_tag) bash

run:
	$(eval ID := $(shell docker run -d ${docker_tag}))
	$(eval IP := $(shell docker inspect --format '{{ .NetworkSettings.IPAddress }}' ${ID}))
	@echo "Running ${ID} @ ftp://${IP}"
	@docker attach ${ID}
	@docker kill ${ID}
