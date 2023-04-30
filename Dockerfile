FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=nonintercative
ENV PATH="${PATH}:/usr/local/go/bin:$HOME/go/bin"

#WORKDIR $HOME/
WORKDIR /root

RUN apt-get update && apt-get install -y \
    curl \
    tar \
    wget \
    clang \
    pkg-config \
    libssl-dev \
    jq \
    build-essential \
    git \
    make \
    ncdu\
 && rm -rf /var/lib/apt/lists/*

RUN wget -P $HOME "https://golang.org/dl/go1.20.linux-amd64.tar.gz" && \
    rm -rf /usr/local/go && \
    tar -C /usr/local -xzf $HOME/"go1.20.linux-amd64.tar.gz" && \
    rm $HOME/"go1.20.src.tar.gz" 

RUN git clone https://github.com/celestiaorg/celestia-node.git && \
    cd celestia-node/ && \
    git checkout v0.9.1 && \
    make build && \
    make install 

# my_celes_key





