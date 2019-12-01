FROM debian:latest
RUN apt-get update && \
    apt-get -yq install --no-install-recommends curl git && \
    curl -sL https://sentry.io/get-cli/ | bash

