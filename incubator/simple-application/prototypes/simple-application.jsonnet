// @apiVersion 0.0.1
// @name io.ksonnet.pkg.simple-application
// @description Deploy a simple app to kubernetes.
// @param namespace string location and tag of image
// @param name string json file containing values.


local k = import 'k.libsonnet';
local app = import 'incubator/simple-application/simple-application.libsonnet';

local namespace = "import 'param://namespace'";
local name = "import 'param://name'";

k.core.v1.list.new([
  app.parts.service(name, namespace)
])
