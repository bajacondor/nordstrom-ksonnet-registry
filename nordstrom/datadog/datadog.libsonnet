{
    parts:: {
        container(apikey):: {
            spec+: {
                template+: {
                    spec+: {
                        containers+: [{
                            name: "datadog",
                            image: "datadog/agent:6.2.1",
                            env: [
                                {
                                    name: "DATADOG_API_KEY",
                                    value: apikey
                                }
                            ],
                            imagePullPolicy: "IfNotPresent",
                            ports: [
                                {
                                    name: "datadog",
                                    containerPort: 4321,
                                }
                            ]
                        }]
                    }
                }
            }
        }
    }
}
