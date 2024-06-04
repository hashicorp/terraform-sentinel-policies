# [attribute_contains_items_not_in_list](../tfstate-functions.sentinel#L440)
This function filters a collection of resources, data sources, or blocks to those with an attribute that contains any items that are not in a given list. A policy would call it when it wants the attribute to only contain members of the list (but not necessarily all of them).

## Sentinel Module
This function is contained in the [tfstate-functions.sentinel](../tfstate-functions.sentinel) module.

## Declaration
`func attribute_contains_items_not_in_list(resources, attr, allowed, prtmsg)`

## Arguments
* **resources**: a map of resources derived from [`tfstate.resources`](https://www.terraform.io/docs/cloud/sentinel/import/tfstate-v2.html#the-resources-collection) or a list of blocks returned by the `blocks` function.
* **attr**: the name of a resource attribute given as a string that should should only contain items from a given list. The attribute should be a list or a map. If the attribute is nested, the various blocks containing it should be delimited with periods (`.`). Indices of lists should not include brackets and should start with 0. So, you would use `boot_disk.0.initialize_params` rather than `boot_disk[0].initialize_params`.
* **allowed**: a list of values the attribute is allowed to contain. If you want to allow null, include "null" in the list.
* **prtmsg**: a boolean indicating whether violation messages should be printed (if `true`) or not (if `false`).

## Common Functions Used
This function calls the [evaluate_attribute](./evaluate_attribute.md) and the [to_string](./to_string.md) functions.

## What It Returns
This function returns a map with two maps, `resources` and `messages`, both of which are indexed by the complete [addresses](https://www.terraform.io/docs/internals/resource-addressing.html) of the resources, data sources, or blocks that meet the condition of the filter function. The `resources` map contains the actual resource instances for which the attribute (`attr`) contains any items that are not in the list (`allowed`) while the `messages` map contains the violation messages associated with those instances.

## What It Prints
This function prints the violation messages if the parameter, `prtmsg`, was set to `true`. Otherwise, it does not print anything.

## Examples
Here is an example of calling this function, assuming that the tfstate-functions.sentinel file that contains it has been imported with the alias `state`:
```
violatingIRs = state.attribute_contains_items_not_in_list(ingressRules,
               "cidr_blocks", allowed_cidrs, false)
```
