# [datasources](../tfstate-functions.sentinel#L72)
This function finds all data source instances of a specific type in the state of the current workspace using the [tfstate/v2](https://www.terraform.io/docs/cloud/sentinel/import/tfstate-v2.html) import.

## Sentinel Module
This function is contained in the [tfstate-functions.sentinel](../tfstate-functions.sentinel) module.

## Declaration
`func datasources(type)`

## Arguments
* **type**: the type of datasource to find, given as a string.

## Common Functions Used
None

## What It Returns
This function returns a single flat map of data source instances indexed by the complete [addresses](https://www.terraform.io/docs/internals/resource-addressing.html) of the instances. The map is actually a filtered sub-collection of the [`tfstate.resources`](https://www.terraform.io/docs/cloud/sentinel/import/tfstate-v2.html#the-resources-collection) collection.

## What It Prints
This function does not print anything.

## Examples
Here are some examples of calling this function, assuming that the tfstate-functions.sentinel file that contains it has been imported with the alias `state`:
```
currentAMIs = state.datasources("aws_ami")

currentImages = state.datasources("azurerm_image")

currentImages = state.datasources("google_compute_image")

currentDatastores = state.datasources("vsphere_datastore")
```

This function is used by the [restrict-ami-owners.sentinel (AWS)](../../../aws/restrict-ami-owners.sentinel) policy.
