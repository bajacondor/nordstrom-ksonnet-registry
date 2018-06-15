// @apiVersion 0.0.1
// @name io.ksonnet.pkg.datadog-container
// @description A Datadog sidecar container.
// @shortDescription A Datadog sidecar container. Make sure you have the secret for the api key loaded into your namespace.
// @param apikey_secret_name string Name of K8S secret where api key is saved.
// @param apikey_secret_key string Key to get of apikey secret.
// @param name string Name of service.

local dd = import 'nordstrom/datadog/datadog.libsonnet';

local secretName = import 'param://apikey_secret_name';
local secretKey = import 'param://apikey_secret_key';
local name = import 'param://name';
dd.parts.container(secretName, secretKey)
