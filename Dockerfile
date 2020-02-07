FROManapsix/alpine-java:8_server-jre

MAINTAINERDmitryGerasimov<q2digger@gmail.com>

ENVBASE_DIR=/usr/local/tomcat/license-server
ENVBUILD

COPYdocker-launcher.sh/usr/bin/docker-launcher.sh

RUNset-x\\
&&apkupdate-qq\
&&apkaddca-certificatescurltiniunzip\
&&update-ca-certificates2>/dev/null||true\
&&rm-rf/var/lib/{apt,dpkg,cache,log}//tmp/*/var/tmp/*

RUNmkdir-p$BASE_DIR\
&&/usr/bin/curl-Ls-oinstaller-${BUILD}.ziphttps://download.jetbrains.com/lcsrv/license-server-installer.zip\
&&unzip-d$BASE_DIRinstaller-${BUILD}.zip\
&&rm-finstaller-${BUILD}.zip\
&&chmod+x/usr/bin/docker-launcher.sh

EXPOSE8080

ENTRYPOINT["/sbin/tini","--"]
CMD["/usr/bin/docker-launcher.sh"]
