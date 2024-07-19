# Makefile

# Variables
DOCKER_COMPOSE = docker-compose

.PHONY: help build up down logs test

help:  ## Display this help message
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-15s %s\n", $$1, $$2}'

build:  ## Build the Docker containers
	$(DOCKER_COMPOSE) build

up:  ## Start the Docker containers
	$(DOCKER_COMPOSE) up

down:  ## Stop the Docker containers
	$(DOCKER_COMPOSE) down

logs:  ## Show logs for all services
	$(DOCKER_COMPOSE) logs -f

test:  ## Run tests using pytest
	$(DOCKER_COMPOSE) run web pytest