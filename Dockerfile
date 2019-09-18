ARG REGISTRY_PATH=gmitirol
FROM $REGISTRY_PATH/alpine310:v1
LABEL maintainer="gmi-edv@i-med.ac.at"

RUN set -xe && \
    apk --no-cache --update upgrade && \
    apk add --no-cache --update dovecot

ADD config/dovecot.conf /etc/dovecot/dovecot.conf
ADD scripts/start.sh /start.sh

EXPOSE 143
CMD ["/start.sh"]

