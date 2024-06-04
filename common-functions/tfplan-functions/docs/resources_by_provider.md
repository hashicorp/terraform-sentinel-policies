# [resources_by_provider](../tfplan-functions.sentinel#L37)
This function finds all resource instances for a specific provider in the current plan that are being created, modified, or read using the [tfplan/v2](https://www.terraform.io/docs/cloud/sentinel/import/tfplan-v2.html) import. Resources with the "no-op" action are also included, but only if their `change.after` attribute is not null.

If you are using Terraform 0.12, use the short form of the provider name such as "null". If you are using Terraform 0.13, you can use the short form or the fully-qualified provider source such as "registry.terraform.io/hashicorp/null", but only use the latter if you are only want to find resources from a specific registry. If you use the short form, the function will reduce `rc.provider_name` for each resource to the short form, but if you use the long form, it will not.

## Sentinel Module
This function is contained in the [tfplan-functions.sentinel](../tfplan-functions.sentinel) module.

## Declaration
`func resources_by_provider(provider)`

## Arguments
* **provider**: the provider, given as a string.

## Common Functions Used
None

## What It Returns
This function returns a single flat map of resource instances indexed by the complete [addresses](https://www.terraform.io/docs/internals/resource-addressing.html) of the instances. The map is actually a filtered sub-collection of the [`tfplan.resource_changes`](https://www.terraform.io/docs/cloud/sentinel/import/tfplan-v2.html#the-resource_changes-collection) collection.

## What It Prints
This function does not print anything.

## Examples
Here are some examples of calling this function, assuming that the tfplan-functions.sentinel file that contains it has been imported with the alias `plan`:
```
allAWSResources = plan.resources_by_provider("aws")

allAWSResources = plan.resources_by_provider("registry.terraform.io/hashicorp/aws")

allAzureResources = plan.resources_by_provider("azurerm")

allGCPResources = plan.resources_by_provider("google")

allVMwareResources = plan.resources_by_provider("vsphere")
```
