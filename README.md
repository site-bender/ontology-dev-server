# Ontology Dev Server

- :curly_loop: **Fuseki with UI** - The SPARQL server with inferencing. 
- :turtle: **SOH tools** - Auto reload Turtle file changes on save.
- :bulb: **OWLFBRuleReasoner enabled** - OWL/lite reasoner by default, Auto-update on save.
- :dart: **Deno JS engine** - E2E tests with examples.
- :whale: **Docker container** - Across platforms.

## Requirements

- Install [Docker](https://docs.docker.com/get-docker/) and [GNU make](https://www.gnu.org/software/make/)

## How to start

- `make` to start the server and load [main.ttl](./src/main.ttl).

## How to reload manually

- `make load` to load [main.ttl](./src/main.ttl).

## How to reload automatically 

### Jetbrains' IDE

- Go to Settings > Tools > File Watchers
- Import [watchers config](ideConfig/jetbrains/watchers.xml)
- Setup scope and working directory

### VS code

## How to test

- `make test` to run all tests in [the e2e folder](./e2e).

### Jetbrains' IDE

- Install [Deno plugin](https://plugins.jetbrains.com/plugin/14382-deno)

### VS code

## Log

All Fuseki logs will be printed to [this log file](./log).