export const url = "http://localhost:3030/ds/sparql";
export const headers = {
    "accept": "application/sparql-results+json",
    "content-type": "application/x-www-form-urlencoded",
};

export const prefix =`
    PREFIX main:   <https://raw.githubusercontent.com/site-bender/ontology-dev-server/main/src/main.ttl#> 
    PREFIX news:   <https://raw.githubusercontent.com/site-bender/ontology-dev-server/main/src/news.ttl#> 
    PREFIX places: <https://raw.githubusercontent.com/site-bender/ontology-dev-server/main/src/places.ttl#> 
`
