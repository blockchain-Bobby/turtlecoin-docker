FROM alpine as git

ARG BRANCH=development
ENV BRANCH=${BRANCH}

ARG ENABLE_SSL=false
ENV ENABLE_SSL=${ENABLE_SSL}

WORKDIR /opt/turtlecoin

RUN apk add --no-cache --virtual git-dependency git && \
    git clone -b ${BRANCH} --single-branch https://github.com/turtlecoin/turtlecoin.git . && \
    mkdir /opt/turtlecoin/build && \
    apk del git-dependency

FROM alpine as builder

COPY --from=git /opt/turtlecoin /opt/turtlecoin

WORKDIR /opt/turtlecoin/build

# add packages and build
RUN apk add --no-cache --virtual general-dependencies \
    git \
    cmake \
    binutils \
    expat-dev \
    build-base \
    boost-static \
    boost-dev \
    libucontext-dev \
    openssl-dev && \
    cmake -DCMAKE_C_FLAGS="-lucontext" -DENABLE_SSL=${ENABLE_SSL} .. && \
    make -j$(nproc) && \
    mkdir /turtlecoin && \
    find src -type f -perm /a+x -exec strip {} \; -exec mv {} /turtlecoin \; && \
    apk del general-dependencies

FROM scratch as base

COPY --from=builder /turtlecoin/ /
