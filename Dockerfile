FROM alpine:latest

RUN apk add --no-cache mariadb mariadb-client mariadb-server-utils && \
    rm -f /var/cache/apk/*

ADD docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh

RUN mkdir -p /docker-entrypoint-initdb.d && \
    mkdir -p /scripts/pre-exec.d && \
    mkdir -p /scripts/pre-init.d && \
    chmod -R 755 /scripts && \
    chmod a+x /usr/local/bin/docker_entrypoint.sh

EXPOSE 3306

WORKDIR /var/lib/mysql

ENTRYPOINT ["/scripts/docker_entrypoint.sh"]
