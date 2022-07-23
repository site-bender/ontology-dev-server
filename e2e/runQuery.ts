import {NewsResponse} from "./types.ts";
import {HEADERS, URL} from "./constants.ts";

async function runQuery(query: string) {
    const body = new URLSearchParams()
    body.set('query', query)

    const json: NewsResponse = await (await fetch(URL, {
        headers: HEADERS,
        body,
        method: "POST",
    })).json();

    return json
}

export default runQuery