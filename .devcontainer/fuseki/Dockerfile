FROM archlinux

ENV JAVA_HOME="/usr/lib/jvm/default-runtime/"
ENV DENO_INSTALL="/root/.deno"
ENV	PATH="${DENO_INSTALL}/bin:${JAVA_HOME}/bin/:${PATH}"
ENV FUSEKI_VERSION="4.5.0"
ENV FUSEKI_INSTALL="/opt/fuseki"
ENV FUSEKI_BASE="/var/fuseki"
ENV PROJECT_ROOT="/app"

ENV FUSEKI_BIN_URL="https://dlcdn.apache.org/jena/binaries/apache-jena-fuseki-${FUSEKI_VERSION}.tar.gz"
ENV DENO_INSTALLER_URL="https://deno.land/install.sh"

LABEL org.opencontainers.image.authors="https://github.com/natebowang"
LABEL org.opencontainers.image.description="Apache Jena Fuseki Container"
LABEL org.opencontainers.image.source=""
LABEL org.opencontainers.image.title="Apache Jena Fuseki"
LABEL org.opencontainers.image.url=""
LABEL org.opencontainers.image.version="${FUSEKI_VERSION}"

RUN mkdir ${FUSEKI_INSTALL}

RUN pacman -Syu --noconfirm
RUN pacman -S jdk-openjdk --noconfirm
RUN pacman -S ruby --noconfirm
RUN pacman -S unzip --noconfirm
RUN pacman -S --clean --noconfirm

RUN curl -fsSL ${FUSEKI_BIN_URL} \
      | tar -xvz -C ${FUSEKI_INSTALL} --strip-components 1

RUN curl -fsSL ${DENO_INSTALLER_URL} | sh

EXPOSE 3030
CMD sh -c "${FUSEKI_INSTALL}/fuseki-server --config=${PROJECT_ROOT}/.devcontainer/fuseki/configTdb2Mem.ttl > ${PROJECT_ROOT}/log 2>&1"
