#!/bin/bash -Eeu

echo "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories

apk add --no-cache gcc@edge g++@edge musl-dev make gcovr
