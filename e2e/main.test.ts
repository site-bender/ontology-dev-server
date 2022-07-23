import {assertStringIncludes} from "https://deno.land/std@0.147.0/testing/asserts.ts";
import {PREFIX} from "./constants.ts";
import runQuery from "./runQuery.ts";

Deno.test("Triple loading test", async () => {
    const query = `${PREFIX}
        SELECT ?news WHERE { ?news main:happenedIn places:_auckland}
    `
    const result = await runQuery(query)

    assertStringIncludes(result.results.bindings[0].news.value, "_news1");
});

Deno.test("Triple inferring test", async () => {
    const query = `${PREFIX}
        SELECT ?news WHERE { places:_auckland main:mentionedIn ?news}
    `
    const result = await runQuery(query)

    assertStringIncludes(result.results.bindings[0].news.value, "_news1");
});
