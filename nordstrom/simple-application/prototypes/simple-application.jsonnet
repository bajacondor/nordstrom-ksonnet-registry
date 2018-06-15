// @apiVersion 0.0.1
// @name io.ksonnet.pkg.simple-application
// @description Deploy a simple app to kubernetes.
// @shortDescription Deploy a simple app to kubernetes.
// @param name string name of service.
// @param image string Location and tag of container image.
// @optionalParam namespace string Location and tag of image. Defaults to context.
// @optionalParam replicas number Number of replicas. Defaults to 1.
// @optionalParam cpu-request string Requested cpu resources. Defaults to 300m.
// @optionalParam memory-request string Requested memory resources. Defaults to 200Mi.
// @optionalParam container-port number Container port. Defaults to 8080.
// @optionalParam protocol string Protocol of service. Defaults to TCP.

local k = import 'k.libsonnet';
local app = import 'nordstrom/simple-application/simple-application.libsonnet';

local name = "import 'param://name'";
local namespace = "import 'param://namespace'";
local replicas = if "import 'param://replicas'" == "" then 1 else "import 'param://replicas'";
local cpuRequest = "import 'param://cpu-request'";
local memoryRequest = "import 'param://memory-request'";
local containerPort = if "import 'param://container-port'" == "" then 8080 else "import 'param://container-port'";
local protocol = "import 'param://protocol'";
local image = "import 'param://image'";

k.core.v1.list.new([
  app.parts.deployment(
      image=image,
      name=name,
      namespace=namespace,
      replicas=replicas,
      cpuRequest=cpuRequest,
      memoryRequest=memoryRequest,
      containerPort=containerPort,
      protocol=protocol
  ),
  app.parts.service(name=name,
      namespace=namespace,
      containerPort=containerPort,
      protocol=protocol
  ),
])