SOURCE:="../source/opinsys-os-opinsys-bullseye-2023-03-28-074633-amd64.img"
PATCH:="./patch"

.PHONY: build

build:
	@./bin/build-image $(PATCH) $(SOURCE)
