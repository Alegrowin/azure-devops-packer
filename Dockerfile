# Using this line to trigger a PR using dependabot on github from Github Action
FROM hashicorp/packer:1.5.4 as dependency

FROM node:12-alpine

LABEL maintainer="Alexandre Proulx"
LABEL "com.azure.dev.pipelines.agent.handler.node.path"="/usr/local/bin/node"

RUN apk add --no-cache --virtual .pipeline-deps readline linux-pam \
  && apk add bash sudo shadow \
  && apk del .pipeline-deps

COPY --from=dependency /bin/packer /bin/packer
