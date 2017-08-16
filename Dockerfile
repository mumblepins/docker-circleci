FROM buildpack-deps:stretch

RUN set -ex \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        apt-transport-https \
        software-properties-common \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
    && add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/debian \
        $(lsb_release -cs) \
        stable" \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        docker-ce \
    && rm -rf /var/lib/apt/lists/*

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION=1.0.0
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="Docker-on-Debian-CircleCI" \
      org.label-schema.description="Docker on Debian for CircleCI" \
      org.label-schema.url="https://hub.docker.com/r/mumblepins/docker-on-debian-circleci/" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/mumblepins/docker-on-debian-circleci.git" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0" \
      maintainer="Daniel Sullivan <https://github.com/mumblepins>"

CMD [ "/bin/bash" ]
