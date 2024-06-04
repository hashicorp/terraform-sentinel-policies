# [evaluate_attribute](../tfplan-functions.sentinel#L254)
This function evaluates the value of an attribute within a resource, data source, or block. The attribute can be deeply nested.

## Sentinel Module
This function is contained in the [tfplan-functions.sentinel](../tfplan-functions.sentinel) module.

## Declaration
`func evaluate_attribute(r, attribute)`

## Arguments
* **r**: a single resource or block containing an attribute whose value you want to determine. The function converts a plain resource reference like `rc` tp `rc.change.after`; if you want to evaluate the previous state, pass `rc.change.before`.
* **attribute**: a string giving the attribute. If the attribute is nested, the various blocks containing it should be delimited with periods (`.`). Indices of lists should not include brackets and should start with 0. So, you would use `boot_disk.0.initialize_params.0.image` rather than `boot_disk[0].initialize_params[0].image`. If `r` represents a block, then `attribute` should be specified relative to that block.

In practice, this function is only called by the filter functions, so the specification of the `attribute` parameter will be done when calling them.

## Common Functions Used
This function calls itself recursively to support nested attributes of resources and blocks.

## What It Returns
This function returns the value of the attribute of the resource or block. The type will vary depending on what kind of attribute is evaluated.

## What It Prints
This function does not print anything.

## Examples
This function is called by all of the filter functions in the tfplan-functions.sentinel module. Here is a typical example:
```
v = evaluate_attribute(rc, attr) else null
```
