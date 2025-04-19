#!/bin/bash
set -euxo pipefail

# Helpful context messages
# Set up a nice welcome message explaining where to find stuff
echo "BPF compiler can be found in: /usr/local/src/compiler"
echo "Source code should is mounted in the /src directory by default"
echo "BPF programs can be comiled from the compiler dir with: make build-ebpf-program SOURCE_DIR=/src/<my-example>"

# By default docker does not mount /sys/kernel/debug and this is necessary
mount -t debugfs none /sys/kernel/debug

exec "$@"