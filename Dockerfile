FROM debian:jessie

COPY consul /usr/local/bin/
COPY dist/ /dist

ENTRYPOINT ["consul"]
CMD ["agent", "-data-dir", "/data", "-ui-dir", "/dist", "-server", "-bootstrap"]
