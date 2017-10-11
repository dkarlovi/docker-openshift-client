FROM alpine:latest AS downloader
ENV ORIGIN_VERSION v3.6.0-c4dd4cf
ENV ORIGIN_URL https://github.com/openshift/origin/releases/download/v3.6.0/openshift-origin-client-tools-${ORIGIN_VERSION}-linux-64bit.tar.gz
ENV ORIGIN_SHA ecb0f52560ac766331052a0052b1de646011247f637c15063f4d74432e1ce389
WORKDIR /tmp
RUN apk add --no-cache coreutils curl  && \
    curl -L -o openshift-origin-client-tools.tar.gz ${ORIGIN_URL} && \
    sha256sum openshift-origin-client-tools.tar.gz && \
    echo "${ORIGIN_SHA} openshift-origin-client-tools.tar.gz" | sha256sum -c - && \
    tar xzvf openshift-origin-client-tools.tar.gz --strip 1

FROM frolvlad/alpine-glibc
RUN apk add --no-cache ca-certificates
COPY --from=downloader /tmp/oc /usr/local/bin/

