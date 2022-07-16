PORT_HOST := 3040

DC := PORT=${PORT_HOST} docker compose -f .devcontainer/docker-compose.yml

CHECK := sh /app/.devcontainer/fuseki/checkHttpUntilSuccess.sh
SPUT := /opt/fuseki/bin/s-put http://localhost:3030/ds default /app/src/main.ttl
TEST := deno test --allow-all /app/e2e

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
	@date +"Ontology is loaded at %FT%T%z"

test:
	@$(DC) exec fuseki sh -c "${TEST}"
