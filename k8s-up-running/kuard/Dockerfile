# STAGE 1: Build
FROM golang:1.12-alpine AS build


RUN pwd
RUN ls -al
RUN ls -al bin/
RUN ls -al src/

# Install Node and NPM.
RUN apk update && apk upgrade && apk add --no-cache git nodejs bash npm

RUN pwd
RUN ls -al
RUN ls -al bin/
RUN ls -al src/

# Get dependencies for Go part of build
RUN go get -u github.com/jteeuwen/go-bindata/...
RUN go get github.com/kubernetes-up-and-running/kuard...

RUN pwd
RUN ls -al
RUN ls -al bin/
RUN ls -al pkg/
RUN ls -al src/
RUN ls -al src/github.com/
RUN ls -al src/github.com/jteeuwen/
RUN ls -al src/github.com/jteeuwen/go-bindata

WORKDIR /go/src/github.com/kubernetes-up-and-running/kuard

RUN pwd
RUN ls -al

# Copy all sources in
COPY . .

RUN pwd
RUN ls -al

# This is a set of variables that the build script expects
ENV VERBOSE=0
ENV PKG=github.com/kubernetes-up-and-running/kuard
ENV ARCH=amd64
ENV VERSION=test

# When running on Windows 10, you need to clean up the ^Ms in the script
RUN dos2unix build/build.sh

RUN pwd
RUN ls -al

# Do the build. Script is part of incoming sources.
RUN build/build.sh

# STAGE 2: Runtime
FROM alpine

RUN pwd
RUN ls -al

USER nobody:nobody
COPY --from=build /go/bin/kuard /kuard

RUN pwd
RUN ls -al

CMD [ "/kuard" ]