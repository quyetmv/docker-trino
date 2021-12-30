FROM openjdk:11-jdk-buster

ENV JAVA_HOME /usr/java/default
ENV PATH $PATH:$JAVA_HOME/bin
ENV VERSION=367
ENV TRINO_VERSION=${VERSION}
ENV TRINO_HOME=/usr/local/trino
ENV TRINO_SERVER_URL="https://repo1.maven.org/maven2/io/trino/trino-server/${TRINO_VERSION}/trino-server-${TRINO_VERSION}.tar.gz"
ENV TRINO_CLIENT_URL="https://repo1.maven.org/maven2/io/trino/trino-cli/${TRINO_VERSION}/trino-cli-${TRINO_VERSION}-executable.jar"


RUN \
    set -xeu \
    # dependencies
    && apt-get update \
    && apt-get install -y \
    curl    \
    wget    \
    python3 \
    python3-pip \
    && pip3 install jinja2  \
    # set up user
    && groupadd trino --gid 1000 \
    && useradd trino --uid 1000 --gid 1000 \
    # install client
    && curl -o /usr/bin/trino ${TRINO_CLIENT_URL} \
    && chmod +x /usr/bin/trino \
    # install server
    && mkdir -p /usr/lib/trino /data/trino \
    && curl ${TRINO_SERVER_URL} | tar -C /usr/lib/trino -xz --strip 1 \
    && chown -R "trino:trino" /usr/lib/trino /data/trino

COPY --chown=trino:trino bin /usr/lib/trino/bin
COPY --chown=trino:trino default /usr/lib/trino/default

EXPOSE 8080
USER trino:trino
ENV LANG en_US.UTF-8
CMD ["/usr/lib/trino/bin/run-trino"]
