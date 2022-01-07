ARG VERSION

FROM quyetmv/trino-base:${VERSION}
LABEL maintainer="quyetmv@gmail.com"

COPY etc /usr/local/trino/etc

EXPOSE 8080
WORKDIR /usr/local/trino

ENTRYPOINT ["/usr/local/trino/bin/run-trino"]