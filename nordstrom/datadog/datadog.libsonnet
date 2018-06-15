{
    parts:: {
        container(secretName, secretKey):: {
            spec+: {
                template+: {
                    spec+: {
                        containers+: [{
                            name: "datadog",
                            image: "datadog/agent:6.2.1",
                            env: [
                                {
                                    name: "DATADOG_API_KEY",
                                    valueFrom: {
                                        secretKeyRef: {
                                            name: secretName,
                                            key: secretKey
                                        }
                                    }
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
