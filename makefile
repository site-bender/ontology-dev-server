HOST_PORT := 3040
CONTAINER_NAME := ontology-dev-server

DC := HOST_PORT=$(HOST_PORT) CONTAINER_NAME=$(CONTAINER_NAME) docker compose -f .devcontainer/docker-compose.yml
CHECK := bash /app/.devcontainer/checkEndpointUntilSuccess.sh
CLEAR_ALL := /opt/fuseki/bin/s-delete http://localhost:3030/ds default
LOAD_ONE := /opt/fuseki/bin/s-post http://localhost:3030/ds default
LOAD_ALL := find /app/src -name "*.ttl" -ls -exec $(LOAD_ONE) {} \;
TEST := deno test --allow-all /app/e2e

# [More colors](https://www.shellhacks.com/bash-colors/)
GREEN_NORMAL := \e[32m
NO_COLOR := \e[0m

.PHONY: start $(MAKECMDGOALS)

start: startDocker load

restart: restartDocker load

stop:
	@$(DC) stop

startDocker:
	@$(DC) up -d

restartDocker:
	@$(DC) restart

load:
	@$(DC) exec $(CONTAINER_NAME) bash -c "$(CHECK) && $(CLEAR_ALL) && $(LOAD_ALL)"
	@printf "$(GREEN_NORMAL)%s$(NO_COLOR)\n" "Ontology is loaded at $(shell date)"

test:
	@$(DC) exec $(CONTAINER_NAME) bash -c "$(TEST)"
