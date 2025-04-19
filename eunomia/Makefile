PWD:=$(shell pwd)
ARCH:=$(shell uname -m)
EXAMPLE:=

.PHONY: clean
clean:
ifeq ($(strip $(EXAMPLE)),)
	@echo "Usage: make clean EXAMPLE=<bpf-example-dir>"
else
	@echo "Cleaning compilation artifacts"
	rm -f $(EXAMPLE)/*.bpf.o
	rm -f $(EXAMPLE)/package.json
	rm -f $(EXAMPLE)/*.skel.json
endif

.PHONY: compile
compile:
ifeq ($(strip $(EXAMPLE)),)
	@echo $(strip $(EXAMPLE))
	@echo "EXAMPLE=$(EXAMPLE)"
	@echo "Usage: make compile EXAMPLE=<bpf-example-dir>"
else
	@echo "Compiling your BPF program from $(PWD)/$(EXAMPLE) for arch: $(ARCH)"
	docker run -it -v $(PWD)/$(EXAMPLE)/:/src/ ghcr.io/eunomia-bpf/ecc-$(ARCH):latest
endif

.PHONY: dev-container
dev-container:
	@echo "Running the Eunomia dev container"
	docker build --build-arg ARCH=$(ARCH) -t eunomia-dev:local .
	docker run -it -v $(PWD):/src/ --privileged eunomia-dev:local