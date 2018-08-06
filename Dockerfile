FROM sgrio/java-oracle:server_jre_8
MAINTAINER Dmitry Gerasimov <q2digger@gmail.com>

ENV BASE_DIR=/usr/local/tomcat/license-server

COPY docker-launcher.sh /usr/bin/docker-launcher.sh

RUN mkdir -p $BASE_DIR \
  && apt-get update --quiet \
  && update-ca-certificates \
  && apt-get install --quiet --yes --no-install-recommends curl unzip \
  && rm -rf /var/lib/{apt,dpkg,cache,log} /tmp/* /var/tmp/* \
  && /usr/bin/curl -Ls -o installer.zip https://download-cf.jetbrains.com/lcsrv/license-server-installer.zip \
  && unzip -d $BASE_DIR installer.zip \
  && rm -f installer.zip \
  && chmod +x /usr/bin/docker-launcher.sh

EXPOSE 8080

CMD ["/usr/bin/docker-launcher.sh"]
