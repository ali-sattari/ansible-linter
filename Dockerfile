FROM python:2-alpine
LABEL author="Ali Sattari <ali.sattari@gmail.com>"

RUN apk update \
    && apk add --no-cache ansible git gcc binutils gcc libc-dev libffi-dev libtool make openssl-dev \
    && pip2 install ansible-lint

RUN mkdir -p /lint/ansible /code \
    && git clone https://github.com/ansible/galaxy-lint-rules.git /lint/ansible

VOLUME "/code"

ENTRYPOINT ["/usr/local/bin/ansible-lint"]
CMD ["-r /lint/ansible/rules", "-v", "/code"]
