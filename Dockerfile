FROM debian:jessie

RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates

COPY consul /usr/local/bin/
COPY dist/ /dist

ENTRYPOINT ["consul"]
CMD ["agent", "-data-dir", "/data", "-ui-dir", "/dist", "-server", "-bootstrap"]
