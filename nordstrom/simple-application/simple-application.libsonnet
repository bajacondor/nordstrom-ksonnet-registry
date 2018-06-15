{
    parts:: {
        deployment(image, name, namespace, replicas=1, cpuRequest="300m", memoryRequest="200Mi", containerPort=8080, protocol="http"):: {
            "apiVersion": "extensions/v1beta1",
            "kind": "Deployment",
            "metadata": {
              "labels": {
                 "app": name
              },
              "name": name,
              "namespace": namespace
           },
           "spec": {
              "replicas": replicas,
              "strategy": {
                 "rollingUpdate": {
                    "maxSurge": replicas,
                    "maxUnavailable": 0
                 },
                 "type": "RollingUpdate"
              },
              "template": {
                 "metadata": {
                    "labels": {
                       "app": name
                    },
                    "name": name
                 },
                 "spec": {
                    "containers": [
                       {
                          "image": image,
                          "imagePullPolicy": "Always",
                          "name": name,
                          "ports": [
                             {
                                "containerPort": containerPort,
                                "name": "http",
                                "protocol": if protocol == "UDP" then "UDP" else "TCP"
                             }
                          ],
                          "resources": {
                             "requests": {
                                "cpu": cpuRequest,
                                "memory": memoryRequest
                             }
                          }
                       },
                    ],
                    "terminationGracePeriodSeconds": 30,
                 }
              }
           }
        },
        service(name, namespace, containerPort=8080, protocol="HTTP"):: {
            apiVersion: "v1",
            kind: "Service",
            metadata: {
                namespace: namespace,
                name: name,
                labels: {
                    app: name,
                },
               "annotations": {
                  "service.beta.kubernetes.io/aws-load-balancer-backend-protocol": std.asciiLower(protocol),
                  "service.beta.kubernetes.io/aws-load-balancer-cross-zone-load-balancing-enabled": true,
                  "service.beta.kubernetes.io/aws-load-balancer-internal": "0.0.0.0/0"
               },
            },
            spec: {
                "selector": {
                    "app": name
                },
                "type": "LoadBalancer",
                "loadBalancerSourceRanges": [
                   "0.0.0.0/0"
                ],
                ports: [
                    {
                        name: "default-port",
                        port: containerPort,
                        targetPort: containerPort,
                        "protocol": if protocol == "UDP" then "UDP" else "TCP"
                    },
                ]
            },
        },
    },
}
