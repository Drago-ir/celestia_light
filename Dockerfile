FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=nonintercative
ENV PATH="${PATH}:/usr/local/go/bin:$HOME/go/bin"
ENV private_key=

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
    rm $HOME/"go1.20.linux-amd64.tar.gz" 

RUN git clone https://github.com/celestiaorg/celestia-node.git && \
    cd celestia-node/ && \
    #git checkout v0.9.1 && \
    make build && \
    make install && \
    make cel-key && \
    cd


EXPOSE 26659 4318 26658
ENTRYPOINT celestia light init --p2p.network blockspacerace && celestia light start --core.ip https://rpc-blockspacerace.pops.one/ --gateway --gateway.addr localhost --gateway.port 26659 --p2p.network blockspacerace --metrics.tls=false --metrics --metrics.endpoint otel.celestia.tools:4318
CMD echo AUTH_TOKEN=$(celestia light auth admin --p2p.network blockspacerace) && \
    curl -X POST \
     -H "Authorization: Bearer $AUTH_TOKEN" \
     -H 'Content-Type: application/json' \
     -d '{"jsonrpc":"2.0","id":0,"method":"p2p.Info","params":[]}' \
     http://localhost:26658



# my_celes_key





