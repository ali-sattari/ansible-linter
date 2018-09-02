FROM python:2-alpine
LABEL author="Ali Sattari <ali.sattari@gmail.com>"

RUN apk update \
    && apk add --no-cache binutils gcc libc-dev libffi-dev libtool make openssl-dev \
    && pip2 install ansible-lint

RUN apk del binutils gcc libc-dev libffi-dev libtool make openssl-dev \
    && rm -rf /root/.cache/

ADD https://github.com/ansible/galaxy-lint-rules/archive/master.zip /lint/ansible

RUN mkdir /code
VOLUME "/code"

ENTRYPOINT ["/usr/local/bin/ansible-lint"]
CMD ["-r /lint/ansible/rules", "-v", "/code"]
