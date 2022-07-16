PORT_HOST := 3040

DC := PORT=${PORT_HOST} docker compose -f .devcontainer/docker-compose.yml

CHECK := sh /app/.devcontainer/fuseki/checkHttpUntilSuccess.sh
SPUT := /opt/fuseki/bin/s-put http://localhost:3030/ds default /app/src/main.ttl
TEST := deno test --allow-all /app/e2e

# [More colors](https://www.shellhacks.com/bash-colors/)
GREEN_NORMAL := \e[32m
NO_COLOR := \e[0m

.PHONY: all $(MAKECMDGOALS)

start: startDocker load

restart: restartDocker load

stop:
	@$(DC) stop

startDocker:
	@$(DC) up -d

restartDocker:
	@$(DC) restart

load:
	@$(DC) exec fuseki sh -c "$(CHECK) && $(SPUT)"
	@printf "$(GREEN_NORMAL)%s$(NO_COLOR)\n" "Ontology is loaded at $(shell date)"

test:
	@$(DC) exec fuseki sh -c "$(TEST)"
