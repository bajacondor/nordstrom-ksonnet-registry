// @apiVersion 0.0.1
// @name io.ksonnet.pkg.simple-application
// @description Deploy a simple app to kubernetes.
// @shortDescription Deploy a simple app to kubernetes.
// @param name string name of service.
// @optionalParam image string image Location and tag of container image.
// @optionalParam namespace string default K8S Namespace. Defaults to context.
// @optionalParam replicas number 1 Number of replicas. Defaults to 1.
// @optionalParam cpuRequest string 300m Requested cpu resources. Defaults to 300m.
// @optionalParam memoryRequest string 200Mi Requested memory resources. Defaults to 200Mi.
// @optionalParam containerPort number 8080 Container port. Defaults to 8080.
// @optionalParam protocol string HTTP Protocol of service. Defaults to HTTP.

local k = import 'k.libsonnet';
local app = import 'nordstrom/simple-application/simple-application.libsonnet';

local name = import 'param://name';
local namespace = import 'param://namespace';
local replicas = import 'param://replicas';
local cpuRequest = import 'param://cpuRequest';
local memoryRequest = import 'param://memoryRequest';
local containerPort = import 'param://containerPort';
local protocol = import 'param://protocol';
local image = import 'param://image';

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
