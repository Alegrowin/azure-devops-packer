# azure-devops-packer

![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/alegrowin/azure-devops-packer?style=plastic)

## Why this image is required

Running Azure DevOps jobs in container has [some requirements](https://docs.microsoft.com/en-us/azure/devops/pipelines/process/container-phases?view=azure-devops#requirements)

### Linux-based containers

The Azure Pipelines system requires a few things in Linux-based containers:

- Bash
- glibc-based
- Can run Node.js (which the agent provides)
- Does not define an ENTRYPOINT
- USER has access to groupadd and other privileges commands without sudo

And on your agent host:

- Ensure Docker is installed
- The agent must have permission to access the Docker daemon

## How to use this image

### Locally

docker run --rm -it -v ~/.aws:/root/.aws -w /packer -v ~/packer:/packer alegrowin/azure-devops-packer packer build /packer/amazon.json

### On Azure DevOps

