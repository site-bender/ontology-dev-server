export type News = {
    news: {
        type: "uri",
        value: string,
    }
}

export type NewsResponse = {
    head: {
        vars: string[]
    },
    results: {
        bindings: News[]
    },
}

