import {assertStringIncludes} from "https://deno.land/std@0.147.0/testing/asserts.ts";
import {NewsResponse} from "./types.ts";
import {headers, url, prefix} from "./constants.ts";

Deno.test("Triple loading test", async () => {
    const query = `${prefix}
        SELECT ?news WHERE { ?news main:happenedIn places:_auckland}
    `
    const body = new URLSearchParams()
    body.set('query', query)

    const json: NewsResponse = await (await fetch(url, {
        headers,
        body,
        method: "POST",
    })).json();

    assertStringIncludes(json.results.bindings[0].news.value, "_news1");
});

Deno.test("Triple inferring test", async () => {
    const query = `${prefix}
        SELECT ?news WHERE { places:_auckland main:mentionedIn ?news}
    `
    const body = new URLSearchParams()
    body.set('query', query)

    const json: NewsResponse = await (await fetch(url, {
        headers,
        body,
        method: "POST",
    })).json();

    assertStringIncludes(json.results.bindings[0].news.value, "_news1");
});
