# [attribute_not_contains_list](../tfplan-functions.sentinel#L384)
This function filters a collection of resources, data sources, or blocks to those with an attribute that does not contain all members of a given list. A policy would call it when it wants the attribute to contain all members of the list.

## Sentinel Module
This function is contained in the [tfplan-functions.sentinel](../tfplan-functions.sentinel) module.

## Declaration
`func attribute_not_contains_list(resources, attr, required, prtmsg)`

## Arguments
* **resources**: a map of resources derived from [`tfplan.resource_changes`](https://www.terraform.io/docs/cloud/sentinel/import/tfplan-v2.html#the-resource_changes-collection) or a list of blocks returned by the `blocks` function.
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
Here are some examples of calling this function, assuming that the tfplan-functions.sentinel file that contains it has been imported with the alias `plan`:
```
violatingEC2Instances = plan.attribute_not_contains_list(allEC2Instances,
                        "tags", mandatory_tags, true)

violatingAzureVMs = plan.attribute_not_contains_list(allAzureVMs,
                    "tags", mandatory_tags, true)

violatingGCEInstances = plan.attribute_not_contains_list(allGCEInstances,
                        "labels", mandatory_labels, true)
```

This function is used by several policies including [enforce-mandatory-tags.sentinel (AWS)](../../../aws/enforce-mandatory-tags.sentinel), [enforce-mandatory-tags.sentinel (Azure)](../../../azure/enforce-mandatory-tags.sentinel), and [enforce-mandatory-labels.sentinel (GCP)](../../../gcp/enforce-mandatory-labels.sentinel).
