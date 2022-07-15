# Ontology Dev Server

- :curly_loop: **[Fuseki with UI](https://jena.apache.org/documentation/fuseki2/fuseki-webapp.html)** - The SPARQL server with inferencing. 
- :turtle: **[SOH tools](https://jena.apache.org/documentation/fuseki2/soh.html)** - Auto reload Turtle file changes on save.
- :bulb: **[OWLFBRuleReasoner enabled](https://jena.apache.org/documentation/inference/)** - OWL/lite reasoner by default, Auto-update on save.
- :dart: **[Deno JS engine](https://deno.land/manual/testing)** - E2E tests with examples.
- :whale: **[Docker container](https://hub.docker.com/_/archlinux/)** - Across platforms.

## Requirements

- Install [Docker](https://docs.docker.com/get-docker/) and [GNU make](https://www.gnu.org/software/make/)

## How to start

1. `make` to start the server and load [main.ttl](./src/main.ttl).
2. Visit [Fuseki web UI](http://localhost:3040/#/dataset/ds/query). The default port is _3040_. If _3040_ is unavailable on your computer, update the `PORT_HOST` in [makefile](./makefile) to change the port. 
3. Query for: 
```SPARQL
PREFIX : <http://www.semanticweb.org/site-bender/ontologies/2022/5/news-ontology#>
SELECT ?news WHERE { :_auckland :mentionedIn ?news}
```
If you get *http://..._news1*, this dev server is started successfully.

## How to reload manually

- `make load` to load [main.ttl](./src/main.ttl).

## How to reload automatically 

**Jetbrains' IDE**

- Go to Settings > Tools > File Watchers
- Import this [watchers config](ideConfig/jetbrains/watchers.xml)
- Setup _scope_ and _working directory_

**VS code**

- TODO

## How to test

- `make test` to run all tests in [the e2e folder](./e2e).

### Edit Deno tests

For editing Deno tests in [e2e](./e2e), you can install a Deno plugin. 

**Jetbrains' IDE**

- Install [Deno plugin](https://plugins.jetbrains.com/plugin/14382-deno)

**VS code**

- TODO

## Log

All Fuseki logs will be printed to [this log file](./log).
