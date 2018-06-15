// @apiVersion 0.0.1
// @name io.ksonnet.pkg.datadog-container
// @description A Datadog sidecar container.
// @shortDescription A Datadog sidecar container.
// @param apikey string Key for datadog to run with.
// @param name string Name of service.

local dd = import 'nordstrom/datadog/datadog.libsonnet';

local apikey = import 'param://apikey';
local name = import 'param://name';
dd.parts.container(apikey)
