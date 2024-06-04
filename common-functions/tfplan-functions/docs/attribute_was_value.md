# [attribute_was_value](../tfplan-functions.sentinel#L650)
This function filters a collection of resources, data sources, or blocks to those with an attribute that was equal to a given value. A policy would call it when it wants the attribute to not equal the given value, especially when trying to delete a resource. Note that this function passes `rc.change.before` instead of `rc` to the `evaluate_attribute()` function which converts `rc` to `rc.change.after`.

## Sentinel Module
This function is contained in the [tfplan-functions.sentinel](../tfplan-functions.sentinel) module.

## Declaration
`func attribute_was_value(resources, attr, value, prtmsg)`

## Arguments
* **resources**: a map of resources derived from [`tfplan.resource_changes`](https://www.terraform.io/docs/cloud/sentinel/import/tfplan-v2.html#the-resource_changes-collection) or a list of blocks returned by the `blocks` function.
* **attr**: the name of a resource attribute given as a string that should not have previously equaled a given value. If the attribute is nested, the various blocks containing it should be delimited with periods (`.`). Indices of lists should not include brackets and should start with 0. So, you would use `boot_disk.0.initialize_params.0.image` rather than `boot_disk[0].initialize_params[0].image`.
* **value**: the value the attribute should not have been equal to. This can be any primitive data type. If you want to match null, set value to "null".
* **prtmsg**: a boolean indicating whether violation messages should be printed (if `true`) or not (if `false`).

## Common Functions Used
This function calls the [evaluate_attribute](./evaluate_attribute.md) and the [to_string](./to_string.md) functions.

## What It Returns
This function returns a map with two maps, `resources` and `messages`, both of which are indexed by the complete [addresses](https://www.terraform.io/docs/internals/resource-addressing.html) of the resources, data sources, or blocks that meet the condition of the filter function. The `resources` map contains the actual resource instances for which the attribute (`attr`) is equal to the given value, `value`, while the `messages` map contains the violation messages associated with those instances.

## What It Prints
This function prints the violation messages if the parameter, `prtmsg`, was set to `true`. Otherwise, it does not print anything.

## Examples
Here is an example of calling this function, assuming that the tfplan-functions.sentinel file that contains it has been imported with the alias `plan`:
```
violatingRDSInstances = plan.attribute_was_value(RDSInstancesBeingDeleted,
                        "deletion_protection", true, false)

violatingAzureAppServices = plan.attribute_was_value(allAzureAppServices,
                            "https_only", true, true)
```

This function is used by the [protect-against-rds-instance-deletion.sentinel (AWS)](../../../aws/protect-against-rds-instance-deletion.sentinel) policy.
