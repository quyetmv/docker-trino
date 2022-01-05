ARG VERSION

FROM quyetmv/trino-base:${VERSION}
LABEL maintainer="quyetmv@gmail.com"

COPY default /usr/local/trino/default

EXPOSE 8181
WORKDIR /usr/local/trino

ENTRYPOINT ["/usr/local/trino/bin/run-trino"]