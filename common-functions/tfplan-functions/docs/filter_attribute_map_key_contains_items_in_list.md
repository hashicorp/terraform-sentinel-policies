# [filter_attribute_map_key_contains_items_in_list](../tfplan-functions.sentinel#L1015)
This function filters a collection of resources, data sources, or blocks to those with an attribute of type map with a specific key that contains any members of a given list. A policy would call it when it does not want the key of the attribute to contain any members of the list. It is based on a function written by [pshamus](https://discuss.hashicorp.com/u/pshamus/summary) [here](https://discuss.hashicorp.com/t/sentinel-checking-nested-tagging-values/21668/4?u=rberlind).

## Sentinel Module
This function is contained in the [tfplan-functions.sentinel](../tfplan-functions.sentinel) module.

## Declaration
`filter_attribute_map_key_contains_items_in_list = func(resources, attr, key, forbidden, prtmsg)`

## Arguments
* **resources**: a map of resources derived from [`tfplan.resource_changes`](https://www.terraform.io/docs/cloud/sentinel/import/tfplan-v2.html#the-resource_changes-collection) or a list of blocks returned by the `find_blocks` function.
* **attr**: the name of a resource attribute given as a string that should not contain any items in a given list in the key `key`. The attribute should be a map. If the attribute is nested, the various blocks containing it should be delimited with periods (`.`). Indices of lists should not include brackets and should start with 0. So, you would use `boot_disk.0.initialize_params` rather than `boot_disk[0].initialize_params`.
* **key**: the name of the key in the map that should not contain certain values.
* **forbidden**: a list of values the key `key` of the attribute should not contain.
* **prtmsg**: a boolean indicating whether violation messages should be printed (if `true`) or not (if `false`).

## Common Functions Used
This function calls the [evaluate_attribute](./evaluate_attribute.md) and the [to_string](./to_string.md) functions.

## What It Returns
This function returns a map with two maps, `resources` and `messages`, both of which are indexed by the complete [addresses](https://www.terraform.io/docs/internals/resource-addressing.html) of the resources, data sources, or blocks that meet the condition of the filter function. The `resources` map contains the actual resource instances for which the attribute (`attr`) has the key `key` that contains any items of the list (`forbidden`) while the `messages` map contains the violation messages associated with those instances.

## What It Prints
This function prints the violation messages if the parameter, `prtmsg`, was set to `true`. Otherwise, it does not print anything.

## Examples
Here is an example of calling this function, assuming that the tfplan-functions.sentinel file that contains it has been imported with the alias `plan`:
```
productionVMs = plan.filter_attribute_map_key_contains_items_in_list(allVMs,
                  "tags","privacy", ["public"], true)
```
It finds VMs that have the `privacy` key of the `tags` attribute equal to or containing "public".
