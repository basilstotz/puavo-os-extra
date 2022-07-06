SOURCE:="path/to/opinsys-os-opinsys-bullseye-2022-06-22-145634-amd64.imt"
PATCH:="./patch"

.PHONY: build

build:
	@./bin/build-image $(PATCH) $(SOURCE)
