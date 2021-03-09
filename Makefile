include .versions

export

all: docker docker-compose docker-machine

init:
ifndef INSTALL_BASE_DIR
	$(error INSTALL_BASE_DIR is undefined)
endif
	mkdir -p $(INSTALL_BASE_DIR)
	cd $(INSTALL_BASE_DIR)

docker: init
ifndef DOCKER_RELEASE_STAGE
	$(error DOCKER_RELEASE_STAGE is undefined)
endif
ifndef DOCKER_VERSION
	$(error DOCKER_VERSION is undefined)
endif
	cd $(INSTALL_BASE_DIR) && curl -fsSL -o dockerbins.tgz "https://download.docker.com/mac/static/$(DOCKER_RELEASE_STAGE)/x86_64/docker-$(DOCKER_VERSION).tgz" && \
	tar xvf  dockerbins.tgz --strip-components 1 docker/docker && rm dockerbins.tgz && chmod 755 $(INSTALL_BASE_DIR)/docker

docker-compose: init
ifndef DOCKER_COMPOSE_VERSION
	$(error DOCKER_COMPOSE_VERSION is undefined)
endif
	curl -fsSL -o $(INSTALL_BASE_DIR)/docker-compose https://github.com/docker/compose/releases/download/$(DOCKER_COMPOSE_VERSION)/docker-compose-Darwin-x86_64 && \
	chmod 755 $(INSTALL_BASE_DIR)/docker-compose

docker-machine: init
ifndef DOCKER_MACHINE_VERSION
	$(error DOCKER_MACHINE_VERSION is undefined)
endif
	curl -fsSL -o $(INSTALL_BASE_DIR)/docker-machine https://github.com/docker/machine/releases/download/v$(DOCKER_MACHINE_VERSION)/docker-machine-Darwin-x86_64 && \
	chmod 755 $(INSTALL_BASE_DIR)/docker-machine
