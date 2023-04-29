FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=nonintercative
#ENV TZ=Europe/Brussels

WORKDIR $HOME
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

RUN wget -P /home "https://go.dev/dl/go1.19.1.src.tar.gz"
RUN rm -rf /usr/local/go 
#RUN tar  -xzf /home/"go1.19.1.linux-amd64.tar.gz" 
#RUN rm "go1.19.1.linux-amd64.tar.gz" 

#RUN echo "export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin" >> $HOME/.bash_profile
#RUN source $HOME/.bash_profile

#RUN ls -a