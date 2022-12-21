FROM ubuntu:jammy
LABEL org.opencontainers.image.authors="Rogier Gerritse <rogierg@electronicsamurai.com>,Jimmy Bristow <jbristow@home-lab.tech>"

ENV TZ="America/Chicago"
ENV DEBIAN_FRONTEND="noninteractive"

COPY *.deb /tmp/

RUN apt-get update && \
  apt-get install -y --no-install-recommends lsb-release || true && \
  dpkg -i /tmp/check-mk-raw-*.jammy_arm64.deb || true && \
  rm /tmp/check-mk-raw-*.jammy_arm64.deb && \
  apt-get install -y -f --no-install-recommends && \
  apt-get autoremove -y && \
  apt-get clean -y && \
  rm -rf /var/lib/apt/lists/*
EXPOSE 5000/tcp
WORKDIR /app
COPY *.sh /app/
CMD ["sh", "/app/run.sh"]

