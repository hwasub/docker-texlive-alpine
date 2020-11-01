FROM alpine:3.12

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

# required packages
RUN apk add cairo icu-libs libgcc libpaper libpng libstdc++ libx11 musl perl pixman poppler zlib

ENV PATH /usr/local/texlive/2020/bin/x86_64-linuxmusl:$PATH
WORKDIR /home

CMD ["/bin/sh"]
