docker_tag 	= nyxmo/ipxe-boot-defaults

UNAME_S        := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
    APP_HOST   := localhost
endif
ifeq ($(UNAME_S),Darwin)
    APP_HOST   := $(shell docker-machine ip default)
endif

build:
	docker build -t $(docker_tag) .