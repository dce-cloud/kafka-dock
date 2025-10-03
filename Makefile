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

echo_init_volume:
	@echo ${DOCKER} volume ls
	@echo ${DOCKER} volume create --name xx
	@echo ${DOCKER} volume ls

.PHONY: enter_apache_doris_fe
enter_apache_doris_fe:
	@${DC_ENTER} ${APACHE_DORIS_FE_CONTAINER_NAME} bash

.PHONY: enter_apache_doris_be
enter_apache_doris_be:
	@${DC_ENTER} ${APACHE_DORIS_BE_CONTAINER_NAME} bash

.PHONY: enter_mysql
enter_mysql:
	@${DC_ENTER} ${MYSQL_CONTAINER_NAME} bash

.PHONY: build_flink up_flink down_flink
build_flink:
	@${DC_BUILD} --no-cache ${FLINK_JOBMANAGER_CONTAINER_NAME} taskmanager
up_flink:
	@${DC_UP} ${FLINK_JOBMANAGER_CONTAINER_NAME} taskmanager
down_flink:
	@${DC_DOWN} ${FLINK_JOBMANAGER_CONTAINER_NAME} taskmanager

.PHONY: enter_jobmanager enter_taskmanager
enter_jobmanager:
	@${DC_ENTER} ${FLINK_JOBMANAGER_CONTAINER_NAME} bash
enter_taskmanager:
	@${DC_ENTER} taskmanager bash

.PHONY: copy_jobmanager_conf copy_taskmanager_conf
copy_jobmanager_conf:
	@${DC_CP} ${FLINK_JOBMANAGER_CONTAINER_NAME}:/opt/flink/conf/flink-conf.yaml ./flink/context/jobmanager/conf/flink-conf.yaml
copy_taskmanager_conf:
	@${DC_CP} taskmanager:/opt/flink/conf/flink-conf.yaml ./flink/context/taskmanager/conf/flink-conf.yaml

.PHONY: enter_dinky
enter_dinky:
	@${DC_ENTER} ${DINKY_CONTAINER_NAME} bash
