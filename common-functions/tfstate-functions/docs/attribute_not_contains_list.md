# [attribute_not_contains_list](../tfstate-functions.sentinel#L333)
This function filters a collection of resources, data sources, or blocks to those with an attribute that does not contain all members of a given list. A policy would call it when it wants the attribute to contain all members of the list.

## Sentinel Module
This function is contained in the [tfstate-functions.sentinel](../tfstate-functions.sentinel) module.

## Declaration
`func attribute_not_contains_list(resources, attr, required, prtmsg)`

## Arguments
* **resources**: a map of resources derived from [`tfstate.resources`](https://www.terraform.io/docs/cloud/sentinel/import/tfstate-v2.html#the-resources-collection) or a list of blocks returned by the `blocks` function.
* **attr**: the name of a resource attribute given as a string that must contain all items from a given list. The attribute should be a list or map. If the attribute is nested, the various blocks containing it should be delimited with periods (`.`). Indices of lists should not include brackets and should start with 0. So, you would use `boot_disk.0.initialize_params` rather than `boot_disk[0].initialize_params`.
* **required**: a list of values all of which the attribute should contain.
* **prtmsg**: a boolean indicating whether violation messages should be printed (if `true`) or not (if `false`).

## Common Functions Used
This function calls the [evaluate_attribute](./evaluate_attribute.md) and the [to_string](./to_string.md) functions.

## What It Returns
This function returns a map with two maps, `resources` and `messages`, both of which are indexed by the complete [addresses](https://www.terraform.io/docs/internals/resource-addressing.html) of the resources, data sources, or blocks that meet the condition of the filter function. The `resources` map contains the actual resource instances for which the attribute (`attr`) does not contain all items of the list (`required`) while the `messages` map contains the violation messages associated with those instances.

## What It Prints
This function prints the violation messages if the parameter, `prtmsg`, was set to `true`. Otherwise, it does not print anything.

## Examples
Here are some examples of calling this function, assuming that the tfstate-functions.sentinel file that contains it has been imported with the alias `state`:
```
violatingEC2Instances = state.attribute_not_contains_list(allEC2Instances,
                        "tags", mandatory_tags, true)

violatingAzureVMs = state.attribute_not_contains_list(allAzureVMs,
                    "tags", mandatory_tags, true)

violatingGCEInstances = state.attribute_not_contains_list(allGCEInstances,
                        "labels", mandatory_labels, true)
```
