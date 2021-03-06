# Ontology Dev Server

- :curly_loop: **[Fuseki with UI](https://jena.apache.org/documentation/fuseki2/fuseki-webapp.html)** - The SPARQL server with inferencing. 
- :turtle: **[SOH tools](https://jena.apache.org/documentation/fuseki2/soh.html)** - Auto reload Turtle file changes on save.
- :bulb: **[OWLFBRuleReasoner enabled](https://jena.apache.org/documentation/inference/)** - OWL/lite reasoner by default. Auto-update on save.
- :dart: **[Deno JS engine](https://deno.land/manual/testing)** - E2E tests with examples.
- :whale: **[Docker container](https://hub.docker.com/_/archlinux/)** - Across platforms.

## Requirements

- Install [Docker](https://docs.docker.com/get-docker/) and [GNU make](https://www.gnu.org/software/make/)

## How to start

1. `make` to start the server and load [all ttl files](./src). The default port is _3040_. If you want to use _3050_ instead, run `make HOST_PORT=3050`. 
2. Visit http://localhost:3040/#/dataset/ds/query.
3. Query the following SPARQL, If you get *http://..._news1*, the dev server is running.
```SPARQL
PREFIX main:   <https://raw.githubusercontent.com/site-bender/ontology-dev-server/main/src/main.ttl#> 
PREFIX news:   <https://raw.githubusercontent.com/site-bender/ontology-dev-server/main/src/news.ttl#> 
PREFIX places: <https://raw.githubusercontent.com/site-bender/ontology-dev-server/main/src/places.ttl#> 

SELECT ?news WHERE { places:_auckland main:mentionedIn ?news}
```
4. Replace [ttl files](./src) with your ontology. 
5. Have some fun.

## How to reload manually

- `make load` to load [all ttl files](./src).

## How to reload automatically 

**Jetbrains' IDE**

1. Go to Settings > Tools > File Watchers
2. Import this [watchers config](ideConfig/jetbrains/watchers.xml)
3. Setup _scope_ equal to [./src](./src)
4. Setup _working directory_ equal to [./](.)

**VS code**

- TODO

## How to test

- `make test` to run all tests in [the e2e folder](./e2e).

### Edit Deno tests

For editing Deno tests in [the e2e folder](./e2e), you can install a Deno plugin. 

**Jetbrains' IDE**

- Install [Deno plugin](https://plugins.jetbrains.com/plugin/14382-deno)

**VS code**

- TODO

## Log

All Fuseki logs will be printed to [this log file](./log).

## APIs
Todo
