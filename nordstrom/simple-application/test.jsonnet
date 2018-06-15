local sa = import "simple-application.libsonnet";
local name="name";
local image="image";
local namespace="namespace";
local cpuRequest="cpuRequest";
local memoryRequest="imemoryRequestmage";
local containerPort="containerPort";
local protocol="protocol";
[
  sa.parts.deployment(name=name,
      namespace=namespace,
      cpuRequest=cpuRequest,
      memoryRequest=memoryRequest,
      image=image
  ),
  sa.parts.service(name=name,
      namespace=namespace,
      containerPort=containerPort,
      protocol=protocol
  ),
]
