IMAGE=dkarlovi/openshift-client
TAG=latest

build:
	docker build --pull -t "${IMAGE}:${TAG}" .
.PHONY=build

push:
	docker push "${IMAGE}:${TAG}"
.PHONY=exec
