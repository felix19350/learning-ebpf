#!/bin/bash
set -euxo pipefail

mount -t debugfs none /sys/kernel/debug

exec "$@"