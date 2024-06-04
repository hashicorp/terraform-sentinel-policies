# [datasources_by_provider](../tfstate-functions.sentinel#L83)
This function finds all data source instances for a specific provider in the state of the current workspace using the [tfstate/v2](https://www.terraform.io/docs/cloud/sentinel/import/tfstate-v2.html) import.

If you are using Terraform 0.12, use the short form of the provider name such as "null". If you are using Terraform 0.13, you can use the short form or the fully-qualified provider source such as "registry.terraform.io/hashicorp/null", but only use the latter if you are only want to find resources from a specific registry. If you use the short form, the function will reduce `rc.provider_name` for each resource to the short form, but if you use the long form, it will not.

## Sentinel Module
This function is contained in the [tfstate-functions.sentinel](../tfstate-functions.sentinel) module.

## Declaration
`func datasources_by_provider(provider)`

## Arguments
* **provider**: the provider, given as a string.

## Common Functions Used
None

## What It Returns
This function returns a single flat map of data source instances indexed by the complete [addresses](https://www.terraform.io/docs/internals/resource-addressing.html) of the instances. The map is actually a filtered sub-collection of the [`tfstate.resources`](https://www.terraform.io/docs/cloud/sentinel/import/tfstate-v2.html#the-resources-collection) collection.

## What It Prints
This function does not print anything.

## Examples
Here are some examples of calling this function, assuming that the tfstate-functions.sentinel file that contains it has been imported with the alias `state`:
```
currentAWSDataSources = state.datasources_by_provider("aws")

currentAWSDataSources = state.datasources_by_provider("registry.terraform.io/hashicorp/aws")

currentAzureDataSources = state.datasources_by_provider("azurerm")

currentGCPDataSources = state.datasources_by_provider("google")

currentVMwareDataSources = state.datasources_by_provider("vsphere")
```
