FROM debian:jessie

RUN mkdir /data && chown 1:1 -R /data && \
    apt-get update && apt-get install -y \
        curl \
        ca-certificates

COPY consul /usr/local/bin/
COPY dist/ /dist
USER 1:1

ENTRYPOINT ["consul"]
CMD ["agent", "-data-dir", "/data", "-ui-dir", "/dist", "-server", "-bootstrap"]
