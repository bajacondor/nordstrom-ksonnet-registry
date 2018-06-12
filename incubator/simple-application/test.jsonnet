local sa = import "simple-application.libsonnet";
[
    sa.parts.service({
        name: "thename",
        namespace: "thenamespace",
        serviceType: "theservicetype",
        selector: "theselector",
        })
]
