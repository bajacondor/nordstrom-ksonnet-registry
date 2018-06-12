#local k = import "k.libsonnet";
#local deployment = k.extensions.v1beta1.deployment;

{
  parts:: {

    service(values):: {
      local defaults = {
        serviceType:: "LoadBalancer",
      },

      apiVersion: "v1",
      kind: "Service",
      metadata: {
        namespace: values.namespace,
        name: values.name,
        labels: {
          app: values.name,
        },
      },
      spec: {
        type: if std.objectHas(values, "serviceType") then values.serviceType else defaults.serviceType,
        ports: [
          {
            name: "http",
            port: 80,
            targetPort: "http",
          },
        ],
        selector: values.selector,
      },
    },

    deployment:: {
      local defaults = {
        image:: "bitnami/node:8.4.0-r1",
        repository:: "https://github.com/jbianquetti-nami/simple-node-app.git",
        revision:: "26679f6",
        imagePullPolicy:: "IfNotPresent",
        resources:: {
          "requests": {
            "memory": "512Mi",
            "cpu": "300m",
          },
        },
        mountPath:: "/app/data",
        labels(name):: {"app": name},
      },
    }
  }
}