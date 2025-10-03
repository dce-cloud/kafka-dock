include .env
include .cmd.env

.PHONY: help test
help:
	@echo "usage: make <option>"
	@echo "options and effects:"
	@echo "    help                     : Show help"
	@echo "    test                     : Test ..."

test:
	@echo "test ..."

.PHONY: echo_init_network
echo_init_network:
	@echo ${DOCKER} network ls
	@echo ${DOCKER} network create --driver ${DOCKER_NETWORK_DRIVER} --subnet=${DOCKER_BACKEND_SUBNET} --gateway=${DOCKER_BACKEND_SUBNET_GATEWAY} ${DOCKER_BACKEND_NETWORK_NAME}
	@echo ${DOCKER} network ls

.PHONY: enter_kafka
enter_kafka:
	@${DC_ENTER} ${KAFKA_CONTAINER_NAME} bash

.PHONY: enter_kafbat_ui
enter_kafbat_ui:
	@${DC_ENTER} ${KAFBAT_UI_CONTAINER_NAME} sh
