FROM alpine:3.8

WORKDIR /tmp

RUN apk update && \
    apk add perl wget xz tar && \
    wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
    tar xfz install-tl-unx.tar.gz && \
    mv install-tl-20* inst && \
    cd inst && \
    echo "selected_scheme scheme-full" > profile && \
    ./install-tl -profile profile && \
    cd .. && \
    rm -rf *

ENV PATH /usr/local/texlive/2018/bin/x86_64-linux:$PATH
WORKDIR /home

CMD ["tlmgr", "--version"]