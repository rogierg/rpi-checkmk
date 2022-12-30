FROM ubuntu:jammy
LABEL org.opencontainers.image.authors="Rogier Gerritse <rogierg@electronicsamurai.com>,Jimmy Bristow <jbristow@home-lab.tech>"

ENV TZ="America/Chicago"
ENV DEBIAN_FRONTEND="noninteractive"


RUN apt-get update && \
  dpkg --print-architecture && \
  ARCH=$(dpkg --print-architecture) && \
  apt-get install -y lsb-release curl ca-certificates || true && \
  curl -LO $(curl -s https://api.github.com/repos/chrisss404/check-mk-arm/releases/latest | grep browser_download_url | cut -d '"' -f 4 | grep jammy_$ARCH.deb) && \
  echo 'Installing package' && \
  dpkg -i check-mk-raw-*.jammy_$ARCH.deb || true && \
  echo 'Installing package requirements' && \
  apt-get install -y -f --no-install-recommends && \
  echo 'Cleaning up...' && \
  rm check-mk-raw-*.jammy_$ARCH.deb && \
  apt-get autoremove -y && \
  apt-get clean -y && \
  rm -rf /var/lib/apt/lists/*


EXPOSE 5000 6557
HEALTHCHECK --interval=1m --timeout=5s \
    CMD omd status || exit 1

COPY docker-entrypoint.sh /
RUN chmod +x docker-entrypoint.sh
WORKDIR /app
ENTRYPOINT ["/docker-entrypoint.sh"]