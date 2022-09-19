PROVIDER   := phillipjensen/golem-provider
IMG_PROVIDER    := golem-provider:${VERSION}
PROVIDER_LATEST_LOCAL    := golem-provider:latest
LATEST_PROVIDER := ${PROVIDER}:${VERSION}



build-amd64:
	@docker build -t ${IMG_PROVIDER} -t ${PROVIDER_LATEST_LOCAL} .
	@docker tag ${IMG_PROVIDER} ${LATEST_PROVIDER}

	@docker tag ${PROVIDER_LATEST_LOCAL} ${PROVIDER}:latest

push-amd64:
	@docker push ${LATEST_PROVIDER}
	@docker push ${PROVIDER}:latest


login:
	@docker login -u ${DOCKER_USER} -p ${DOCKER_PASS}
	