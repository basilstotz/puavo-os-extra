SOURCE:="../source/opinsys-os-opinsys-bookworm-2023-05-09-080121-amd64.img"
PATCH:="./patch"

.PHONY: build
build: build-deb build-script


.PHONY: build-script
build-script:
	@echo "puavo-os-extra-chroot.sh wird gebaut"
	@./bin/make-chroot-script $(PATCH) > puavo-os-extra-chroot.sh
	@chmod +x puavo-os-extra-chroot.sh


.PHONY: build-deb
build-deb:
	@rm *.deb
	@./bin/build-deb.sh


.PHONY: build-image
build-image:
	@./bin/build-image $(PATCH) $(SOURCE)



