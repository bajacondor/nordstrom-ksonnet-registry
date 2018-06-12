// @apiVersion 0.0.1
// @name io.ksonnet.pkg.simple-application
// @description Deploy a simple app to kubernetes.
// @param namespace string Namespace to specify location of app; default is 'default'
// @param name string Name of app to identify all K8s objects in this prototype

local k = import 'k.libsonnet';
local app = import 'incubator/simple-application/simple-application.libsonnet';

local namespace = "import 'param://image'";
local values = "import 'param://values'";

k.core.v1.list.new([
  app.parts.service(values)
])
