ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache \
    python3 \
    py3-pip \
    git \
    curl \
    bash \
    docker-cli \
    openssh-client \
    openssl \
    tzdata \
    ncurses \
    jq

RUN pip3 install hermes-agent --break-system-packages 2>/dev/null || \
    curl -fsSL https://raw.githubusercontent.com/NousResearch/hermes-agent/main/scripts/install.sh | bash

RUN pip3 install faster-whisper --break-system-packages 2>/dev/null || true

COPY run.sh /
RUN chmod a+x /run.sh

WORKDIR /root

CMD ["/run.sh"]
