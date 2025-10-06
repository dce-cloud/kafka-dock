ARG DOCKER_REGISTRY_URL=
ARG KAFKA_VERSION=4.1.0
FROM ${DOCKER_REGISTRY_URL}apache/kafka-native:${KAFKA_VERSION}

LABEL maintainer="zaizai <373045134@qq.com>"

ENV TZ=Asia/Shanghai

COPY --link kafka-bin /opt/kafka/bin

RUN chmod +x /opt/kafka/bin/*.sh
