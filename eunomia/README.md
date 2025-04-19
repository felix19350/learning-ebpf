# Eunomia BPF

This repository sets a minimal development environment using [Eunomia BPF](https://eunomia.dev/). The goal is
to allow the developer to explore the examples and hack around with minimal up front effort.

One of the main challenges with EBPF programming is to correctly set up your local development environment. In order
to address this challenge this repo comes with a handy docker image that prepackages the Eunomia BPF compiler (ecc) and
the Eunomia command line tool (ecli) so that the developer can hit the ground running.

## Basic development workflow

* Run `make dev-container` to initialize the development environment
* Once the shell opens you can compile the hello-world BPF example with: `make build-ebpf-program SOURCE_DIR=/src/hello-world`
* You can run the example with `ecli run /src/hello-world/package.json`
* After the program runs for a while you can inspect the results with `cat /sys/kernel/debug/tracing/trace_pipe | grep "BPF triggered sys_enter_write"`
