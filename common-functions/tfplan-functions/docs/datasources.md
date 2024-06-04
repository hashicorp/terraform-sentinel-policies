# [datasources](../tfplan-functions.sentinel#L88)
This function finds all data source instances of a specific type that are being created, modified, or read in the current plan using the [tfplan/v2](https://www.terraform.io/docs/cloud/sentinel/import/tfplan-v2.html) import. Data sources with the "no-op" action are also included, but only if their `change.after` attribute is not null.

When evaluating data sources that do not reference any computed values (those known after doing an apply), it is usually better to use the [tfstate/v2](https://www.terraform.io/docs/cloud/sentinel/import/tfstate-v2.html) import and the corresponding [datasources](../tfstate-functions/datasources.md) function that uses that import.

## Sentinel Module
This function is contained in the [tfplan-functions.sentinel](../tfplan-functions.sentinel) Sentinel module.

## Declaration
`func datasources(type)`

## Arguments
* **type**: the type of datasource to find, given as a string.

## Common Functions Used
None

## What It Returns
This function returns a single flat map of data source instances indexed by the complete [addresses](https://www.terraform.io/docs/internals/resource-addressing.html) of the instances. The map is actually a filtered sub-collection of the [`tfplan.resource_changes`](https://www.terraform.io/docs/cloud/sentinel/import/tfplan-v2.html#the-resource_changes-collection) collection.

## What It Prints
This function does not print anything.

## Examples
Here are some examples of calling this function, assuming that the tfplan-functions.sentinel file that contains it has been imported with the alias `plan`:
```
allAMIs = plan.datasources("aws_ami")

allImages = plan.datasources("azurerm_image")

allImages = plan.datasources("google_compute_image")

allDatastores = plan.datasources("vsphere_datastore")
```
