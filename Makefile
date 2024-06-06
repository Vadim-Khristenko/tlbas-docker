image_name := voltdiamond/tlbas
image_tag := $(shell date +%Y%m%d)

.PHONY: build
build:
	rm -rf telegram-bot-api
	git clone --recursive https://github.com/Vadim-Khristenko/tlbas.git
	docker build -t $(image_name):$(image_tag) --build-arg nproc=$(shell nproc) .
	docker tag $(image_name):$(image_tag) $(image_name):latest

.PHONY: publish
publish:
	docker push $(image_name):$(image_tag)
	docker push $(image_name):latest

.PHONY: release
release: update build publish
