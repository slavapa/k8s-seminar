FROM golang:1.17-alpine

# Install Node and NPM
RUN apk update && apk upgrade && apk add --no-cache git nodejs bash npm

RUN pwd
RUN ls -al
RUN ls -al bin/
RUN ls -al src/

# Get dependencies for Go part of build
RUN go get -u github.com/jteeuwen/go-bindata/...
RUN go get github.com/tools/godep
RUN go get github.com/kubernetes-up-and-running/kuard

RUN pwd
RUN ls -al
RUN ls -al bin/
RUN ls -al pkg/
RUN ls -al src/
RUN ls -al src/github.com/
RUN ls -al src/github.com/jteeuwen/
RUN ls -al src/github.com/jteeuwen/go-bindata

WORKDIR /go/src/github.com/kubernetes-up-and-running/kuard

# Copy all sources in
COPY . .

RUN pwd
RUN ls -al

# This is a set of variables that the build script expects
ENV VERBOSE=0
ENV PKG=github.com/kubernetes-up-and-running/kuard
ENV ARCH=amd64
ENV VERSION=test

# Do the build. This script is part of incoming sources.
RUN build/build.sh

CMD [ "/go/bin/kuard" ]