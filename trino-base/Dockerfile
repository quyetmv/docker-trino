FROM openjdk:11-jdk-buster

ENV JAVA_HOME /usr/local/openjdk-11
ENV PATH $PATH:$JAVA_HOME/bin
ENV VERSION=367
ENV TRINO_VERSION=${VERSION}
ENV TRINO_HOME=/usr/local/trino
ENV TRINO_SERVER_URL="https://repo1.maven.org/maven2/io/trino/trino-server/${TRINO_VERSION}/trino-server-${TRINO_VERSION}.tar.gz"
ENV TRINO_CLIENT_URL="https://repo1.maven.org/maven2/io/trino/trino-cli/${TRINO_VERSION}/trino-cli-${TRINO_VERSION}-executable.jar"

RUN set -xeu \
    # dependencies
    && apt-get update \
    && apt-get install -y \
    curl    \
    tar     \
    bash    \
    # install client
    && curl -o /usr/bin/trino ${TRINO_CLIENT_URL} \
    && chmod +x /usr/bin/trino \
    # install server
    && mkdir -p /usr/local/trino /data/trino \
    && curl ${TRINO_SERVER_URL} | tar -C /usr/local/trino -xz --strip 1

COPY run-trino /usr/local/trino/bin
RUN chmod +x /usr/local/trino/bin/run-trino

ENV LANG en_US.UTF-8
CMD ["/usr/local/trino/bin/run-trino"]
