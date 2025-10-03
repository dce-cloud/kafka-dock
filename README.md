# kafka-dock
- [kafka 官网](https://kafka.apache.org/)
基于 Docker Compose 搭建的kafka服务环境

# IP地址

内部IP地址从 172.25.40.3 开始

# 服务清单

| status | service | backend ip | version | 备注 |
|---|---|---|---|---|
| &check; | kafka | 172.25.40.3 | 4.1.0 | |
| &check; | kafbat-ui | 172.25.40.4 | latest | |

# 使用到的镜像

```json
[
    "apache/kafka-native:4.1.0",
    "ghcr.io/kafbat/kafka-ui:latest",
]
```
