# Executables (local)
DOCKER_COMP_EXEC := docker compose
ASK_CONFIRMATION := "read -p '\e[31mThis Makefile is meant to be used in a development environment, are you sure you want to continue? (y/n)\e[0m ' REPLY; \
    [ "\$$REPLY" = "y" ] \
    || exit 0; $(DOCKER_COMP_EXEC)"
DOCKER_COMP := $(shell [ "${APP_ENV}" = "prod" ] && echo $(ASK_CONFIRMATION) || echo $(DOCKER_COMP_EXEC))

# Misc
.DEFAULT_GOAL = help

##
## ——————————————————————————— 📜 START OF HELP 📜 ——————————————————————————————
##
## List of commands available
##

help:
	@grep -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' $(firstword $(MAKEFILE_LIST)) | awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
##
## —— Docker 🐳 ————————————————————————————————————————————————————————————————
##
init: ## Builds the Docker images and start them in detach mode
	@$(DOCKER_COMP) up --build -d 

build: ## Builds the Docker images
	@$(DOCKER_COMP) build 

up: ## Start the docker hub in detached mode (no logs)
	@$(DOCKER_COMP) up -d

down: ## Stop the docker hub
	@$(DOCKER_COMP) down

logs: ## Show live logs
	@$(DOCKER_COMP) logs --tail=0 --follow 
##
## —— Drizzle ORM 💾 ————————————————————————————————————————————————————————————
##
db-push: ## Apply changes to the database
	@$(DOCKER_COMP) exec next npx drizzle-kit push

db-generate: ## Generate migrations
	@$(DOCKER_COMP) exec next npx drizzle-kit generate
	
db-migrate: ## Apply migrations
	@$(DOCKER_COMP) exec next npx drizzle-kit migrate

db-pull: ## Pull database
	@$(DOCKER_COMP) exec next npx drizzle-kit db

##
## ——————————————————————————— 📜 END OF HELP 📜 —————————————————————————————————
##