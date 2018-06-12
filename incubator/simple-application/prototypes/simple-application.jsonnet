// @apiVersion 0.0.1
// @name io.ksonnet.pkg.simple-application
// @description Deploy a simple app to kubernetes.
// @param image string location and tag of image
// @param name file json file containing values.

local k = import 'k.libsonnet';
local app = import 'incubator/simple-application/simple-application.libsonnet';

local namespace = "import 'param://image'";
local values = "import 'param://values'";

k.core.v1.list.new([
  app.parts.service(values)
])
