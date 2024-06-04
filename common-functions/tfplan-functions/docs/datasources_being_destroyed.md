# [datasources_being_destroyed](../tfplan-functions.sentinel#L169)
This function finds all data source instances being destroyed but not re-created in the current plan using the [tfplan/v2](https://www.terraform.io/docs/cloud/sentinel/import/tfplan-v2.html) import.

## Sentinel Module
This function is contained in the [tfplan-functions.sentinel](../tfplan-functions.sentinel) module.

## Declaration
`func datasources_being_destroyed()`

## Arguments
None

## Common Functions Used
None

## What It Returns
This function returns a single flat map of data source instances indexed by the complete [addresses](https://www.terraform.io/docs/internals/data source-addressing.html) of the instances. The map is actually a filtered sub-collection of the [`tfplan.data source_changes`](https://www.terraform.io/docs/cloud/sentinel/import/tfplan-v2.html#the-data source_changes-collection) collection.

## What It Prints
This function does not print anything.

## Examples
Here is an example of calling this function, assuming that the tfplan-functions.sentinel file that contains it has been imported with the alias `plan`:
```
datasourcesBeingDestroyed = plan.data sources_being_destroyed()
```
