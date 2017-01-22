FROM knjcode/rpi-ruby:2.3.3

RUN dependencies=' \
        git \
        sqlite3' \
    && echo 'deb http://ftp.jaist.ac.jp/raspbian jessie main contrib non-free' >/etc/apt/sources.list \
    && echo 'deb http://ftp.yz.yamagata-u.ac.jp/pub/linux/raspbian/raspbian/ jessie main contrib non-free' >>/etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends $dependencies \
    && apt-get clean \
    && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*
ENV NODE_VERSION=v5.9.1 \
    NVM_DIR=/usr/local/nvm
RUN : \
    && git clone https://github.com/creationix/nvm.git $NVM_DIR \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION
ENV PATH=$NVM_DIR/versions/node/$NODE_VERSION/bin:$PATH
