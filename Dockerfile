ARG IMAGE_CMK_BASE="ubuntu:jammy"

FROM ${IMAGE_CMK_BASE}
LABEL org.opencontainers.image.authors="Rogier Gerritse <rogierg@electronicsamurai.com>,Jimmy Bristow <jbristow@home-lab.tech>"

ARG CMK_VERSION="2.1.0p18"

ENV TZ="America/Chicago"
ENV DEBIAN_FRONTEND="noninteractive"


COPY *.sh /
RUN chmod +x docker-entrypoint.sh get-package.sh

RUN apt-get update && \
  dpkg --print-architecture && \
  ARCH=$(dpkg --print-architecture) && \
  CODENAME=$(env -i bash -c '. /etc/os-release; echo $VERSION_CODENAME') && \
  apt-get install -y lsb-release curl ca-certificates || true && \
  bash get-package.sh && \
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

WORKDIR /app
ENTRYPOINT ["/docker-entrypoint.sh"]