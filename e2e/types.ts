export type Subject = {
    subject: {
        type: "uri",
        value: string,
    }
}

export type FusekiResponse = {
    head: {
        vars: string[]
    },
    results: {
        bindings: Subject[]
    },
}

