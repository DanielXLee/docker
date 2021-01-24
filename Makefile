.DEFAULT_GOAL:=help

##@ Run

start: ## start docker container
	@docker run -dit \
	--env USERNAME \
	--env PASSWD \
	--name xxqg \
	--restart always \
	danielxlee/xxqg:latest


stop: ## stop docker container
	@docker stop xxqg
	@docker rm xxqg

show-logs: ## show container logs
	@docker logs xxqg -f

##@ Run

build-image: ## build docker image
	@docker build -t danielxlee/xxqg:latest .

push-image: build-image ## push docker image to docker hub
	@docker push danielxlee/xxqg:latest

##@ Help
help: ## Display this help.
	@echo "Usage:\n  make \033[36m<target>\033[0m"
	@awk 'BEGIN {FS = ":.*##"}; \
		/^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-20s\033[0m %s\n", $$1, $$2 } \
		/^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
