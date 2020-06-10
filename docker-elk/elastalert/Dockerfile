FROM alpine

ENV \
  BUILD_DEPS="gcc musl-dev python3-dev musl-dev gcc openssl-dev libffi-dev openssl-dev" \
  ELASTALERT_DIR=/opt/elastalert \
  ELASTALERT_CONFIG=/opt/elastalert/config.yaml \
  ELASTALERT_INDEX=elastalert_status

RUN apk add --no-cache ca-certificates openssl python3 py3-pip
RUN apk add --no-cache $BUILD_DEPS

RUN pip install elastalert

RUN \
  apk del $BUILD_DEPS && \
  rm -rf /var/cache/apk/*

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

WORKDIR $ELASTALERT_DIR

ENTRYPOINT /entrypoint.sh
