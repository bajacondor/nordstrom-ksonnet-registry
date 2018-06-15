// @apiVersion 0.0.1
// @name io.ksonnet.pkg.data-dog-container
// @description A Datadog sidecar container.
// @shortDescription A Datadog sidecar container.
// @param apikey string key for datadog to run with.

local dd = import 'nordstrom/datadog/datadog.libsonnet';

local apikey = import 'param://apikey';

dd.container(apikey);
