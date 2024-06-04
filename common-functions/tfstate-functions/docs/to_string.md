# [to_string](../tfstate-functions.sentinel#L149)
This function converts any Sentinel object including complex compositions of primitive types (string, int, float, and bool), null, undefined, lists, and maps to a string.

## Sentinel Module
This function is contained in the [tfstate-functions.sentinel](../tfstate-functions.sentinel) module.

## Declaration
`func to_string(obj)`

## Arguments
* **obj**: a Sentinel object of any type

## Common Functions Used
This function calls itself recursively to support composite objects.

## What It Returns
This function returns a single string.

## What It Prints
This function does not print anything.

## Examples
This function is called by all of the filter functions in the tfstate-functions.sentinel module. Here is a typical example:
```
message = to_string(address) + " has " + to_string(attr) + " with value " +
          to_string(v) + " that is not in the allowed list: " +
          to_string(allowed)
```
