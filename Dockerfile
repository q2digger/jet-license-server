FROM anapsix/alpine-java:8_server-jre

MAINTAINER Dmitry Gerasimov <q2digger@gmail.com>

ENV BASE_DIR=/usr/local/tomcat/license-server
ENV BUILD 20267

COPY docker-launcher.sh /usr/bin/docker-launcher.sh

RUN set -x \\
    && apk update -qq \
    && apk add ca-certificates curl tini unzip \
    && update-ca-certificates 2>/dev/null || true \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/ /tmp/* /var/tmp/* 

RUN mkdir -p $BASE_DIR \
  && /usr/bin/curl -Ls -o installer-${BUILD}.zip https://download.jetbrains.com/lcsrv/license-server-installer.zip \
  && unzip -d $BASE_DIR installer-${BUILD}.zip \
  && rm -f installer-${BUILD}.zip \
  && chmod +x /usr/bin/docker-launcher.sh

EXPOSE 8080

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/usr/bin/docker-launcher.sh"]
