# [variables_in_module](../tfconfig-functions.sentinel#L150)
This function finds all variables in a specific module in the Terraform configuration of the current plan's workspace using the [tfconfig/v2](https://www.terraform.io/docs/cloud/sentinel/import/tfconfig-v2.html) import.

## Sentinel Module
This function is contained in the [tfconfig-functions.sentinel](../../tfconfig-functions.sentinel) module.

## Declaration
`func variables_in_module(module_address)`

## Arguments
* **module_address**: the address of the module containing variables to find, given as a string. The root module is represented by "". A module named `network` called by the root module is represented by "module.network". if that module contained a module named `subnets`, it would be represented by "module.network.module.subnets".

## Common Functions Used
None

## What It Returns
This function returns a single flat map of variables indexed by the address of the module and the name of the variable. The map is actually a filtered sub-collection of the [`tfconfig.variables`](https://www.terraform.io/docs/cloud/sentinel/import/tfconfig-v2.html#the-variables-collection) collection.

## What It Prints
This function does not print anything.

## Examples
Here are some examples of calling this function, assuming that the tfconfig-functions.sentinel file that contains it has been imported with the alias `config`:
```
allRootModuleVariables = config.variables_in_module("")

allNetworkVariables = config.variables_in_module("module.network")
```
