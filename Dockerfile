# Using this line to trigger a PR using dependabot on github from Github Action
FROM hashicorp/packer:1.5.4 as dependency

FROM ubuntu:18.04
# Keeping that line here as a disclaimer
#LABEL maintainer="The Packer Team <packer@hashicorp.com>"
LABEL maintainer="Alexandre Proulx"

ENV PACKER_VERSION=1.5.4
ENV PACKER_SHA256SUM=c7277f64d217c7d9ccfd936373fe352ea935454837363293f8668f9e42d8d99d

RUN apt update \
    && apt install -y git bash wget openssl ca-certificates unzip \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip 
RUN wget -q https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_SHA256SUMS 
RUN sed -i '/.*linux_amd64.zip/!d' packer_${PACKER_VERSION}_SHA256SUMS 
RUN sha256sum -c packer_${PACKER_VERSION}_SHA256SUMS
RUN unzip packer_${PACKER_VERSION}_linux_amd64.zip -d /bin
RUN rm -f packer_${PACKER_VERSION}_linux_amd64.zip
