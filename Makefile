IMAGE_NAME ?= dbellotti/smat-shell
IMAGE_VERSION ?= latest
DOCKER_TAG := "$(IMAGE_NAME):$(IMAGE_VERSION)"
CODE_DIR ?= /Users/db/Code

image:
	docker build --tag $(DOCKER_TAG) .

run: image
	docker run -it --rm \
		--volume /var/run/docker.sock:/var/run/docker.sock \
		--volume $(CODE_DIR):/root/Code \
		$(DOCKER_TAG)

release: image
	docker push $(DOCKER_TAG)

default: image
