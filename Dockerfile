FROM debian:latest
ENV UPDATED_AT="2021-12-01T07:38:41"
RUN apt-get update && \
    apt-get -yq install --no-install-recommends curl ca-certificates git jq && \
    curl -sL https://sentry.io/get-cli/ | bash && \
    curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash &&\
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
    install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl && \
    YQ_VERSION=v4.15.1 && \
    YQ_BINARY=yq_linux_amd64 && \
    curl -sL https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/${YQ_BINARY} && \
    install -o root -g root -m 0755 ${YQ_BINARY} /usr/local/bin/yq
