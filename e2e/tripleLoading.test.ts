import {assertEquals} from "https://deno.land/std@0.147.0/testing/asserts.ts";
import {FusekiResponse} from "./types.ts";

Deno.test("Triple loading test", async () => {
    const url = "http://localhost:3030/ds/sparql";
    const headers = {
        "accept": "application/sparql-results+json",
        "content-type": "application/x-www-form-urlencoded",
    };
    const body = "query=PREFIX%20%3A%20%3Chttp%3A%2F%2Fwww.semanticweb.org%2Fwangbo%2Fontologies%2F2022%2F5%2Fnews-ontology%23%3E%0A%0ASELECT%20%3Fsubject%0AWHERE%20%7B%20%3Fsubject%20%3AhappenedIn%20%3A_auckland%20%7D";

    const json: FusekiResponse = await (await fetch(url, {
        headers,
        body,
        method: "POST",
    })).json();

    const expectedValue = "http://www.semanticweb.org/wangbo/ontologies/2022/5/news-ontology#_news1"

    assertEquals(json.results.bindings[0].subject.value, expectedValue);
});