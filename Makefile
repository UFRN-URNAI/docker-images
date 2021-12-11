# Variables
ORGANIZATION=urnai
DOCKER_LINTER_IMAGE=${ORGANIZATION}/linter
ROOT=$(shell pwd)
LINT_COMMIT_TARGET_BRANCH=origin/main

# Commands
.PHONY: install-hooks
install-hooks:
	git config core.hooksPath .githooks

.PHONY: build-linter
build-linter:
	@docker build linter/ -t ${DOCKER_LINTER_IMAGE}

.PHONY: build-linter-no-cache
build-linter-no-cache:
	@docker build linter/ -t ${DOCKER_LINTER_IMAGE} --no-cache

.PHONY: push-linter
push-linter:
	@docker push ${DOCKER_LINTER_IMAGE}

.PHONY: lint
lint:
	@docker pull ${DOCKER_LINTER_IMAGE}
	@docker run --rm -v ${ROOT}:/app ${DOCKER_LINTER_IMAGE} " \
		lint-commit ${LINT_COMMIT_TARGET_BRANCH} \
		&& lint-markdown \
		&& lint-dockerfile \
		&& lint-shell-script \
		&& lint-yaml"
