# Development container image for EBPF with eunomia
# Please ensure that the target architecture matches yours

ARG ARCH=x86_64

# Uses the eunomia BPF default image and on top of that
# installs the eunomia cli to be able to run BPF programs
FROM ghcr.io/eunomia-bpf/ecc-${ARCH}:latest

# Get eunomia cli + additional dependencies
RUN apt update && apt install -y fuse3 libncurses5 libbpf-dev

RUN wget https://github.com/eunomia-bpf/eunomia-bpf/releases/download/v1.0.27/ecli -O ecli && \
    chmod +x ./ecli && \
    mv ecli /usr/bin

WORKDIR /src

# Setup the entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]
