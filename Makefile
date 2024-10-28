# Makefile
.PHONY: setup-hooks create-config

REPO_NAME ?= your-repo
GITHUB_ORG ?= zufall-labs

create-config:
	@echo "Creating/updating .zflbs configuration..."
	@echo "GITHUB_ORG=$(GITHUB_ORG)" > .zflbs
	@echo "GITHUB_REPO=$(REPO_NAME)" >> .zflbs
	@echo "Configuration file .zflbs created with repository name: $(REPO_NAME)"

setup-hooks: create-config
	chmod -f +x ./qa/scripts/setup-hooks.sh || true
	QA_DIR=$$(pwd)/qa ./qa/scripts/setup-hooks.sh

show-config:
	@if [ -f .zflbs ]; then \
		echo "Current configuration:"; \
		cat .zflbs; \
	else \
		echo "No configuration file found."; \
	fi