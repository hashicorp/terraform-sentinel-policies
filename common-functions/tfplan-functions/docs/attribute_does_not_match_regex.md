# [attribute_does_not_match_regex](../tfplan-functions.sentinel#L816)
This function filters a collection of resources, data sources, or blocks to those with an attribute that does not match a given regular expression (regex). A policy would call it when it wants the attribute to match that regex.

It uses the Sentinel [matches](https://docs.hashicorp.com/sentinel/language/spec/#matches-operator) operator which uses [RE2](https://github.com/google/re2/wiki/Syntax) regex.

## Sentinel Module
This function is contained in the [tfplan-functions.sentinel](../tfplan-functions.sentinel) module.

## Declaration
`func attribute_does_not_match_regex(resources, attr, expr, prtmsg)`

## Arguments
* **resources**: a map of resources derived from [`tfplan.resource_changes`](https://www.terraform.io/docs/cloud/sentinel/import/tfplan-v2.html#the-resource_changes-collection) or a list of blocks returned by the `blocks` function.
* **attr**: the name of a resource attribute given as a string that should match the given regex. If the attribute is nested, the various blocks containing it should be delimited with periods (`.`). Indices of lists should not include brackets and should start with 0. So, you would use `boot_disk.0.initialize_params.0.image` rather than `boot_disk[0].initialize_params[0].image`.
* **expr**: the regex expression that should be matched. Note that any occurrences of `\` need to be escaped with `\` itself since Sentinel allows certain special characters to be escaped with `\`. For example, if you wanted to match sub-domains of ".acme.com", you would set `expr` to `(.+)\\.acme\\.com$` instead of the more usual `(.+)\.acme\.com$`. If you want to allow `null`, set `expr` to `(<regex>|null)`.
* **prtmsg**: a boolean indicating whether violation messages should be printed (if `true`) or not (if `false`).

## Common Functions Used
This function calls the [evaluate_attribute](./evaluate_attribute.md) and the [to_string](./to_string.md) functions.

## What It Returns
This function returns a map with two maps, `resources` and `messages`, both of which are indexed by the complete [addresses](https://www.terraform.io/docs/internals/resource-addressing.html) of the resources, data sources, or blocks that meet the condition of the filter function. The `resources` map contains the actual resource instances for which the attribute (`attr`) does not match the given regex, `expr`, while the `messages` map contains the violation messages associated with those instances.

## What It Prints
This function prints the violation messages if the parameter, `prtmsg`, was set to `true`. Otherwise, it does not print anything.

## Examples
Here are some examples of calling this function, assuming that the tfplan-functions.sentinel file that contains it has been imported with the alias `plan`:
```
violatingACMCerts = plan.attribute_does_not_match_regex(allACMCerts,
                    "domain_name", "(.+)\\.hashidemos\\.io$", true)

violatingAccessKeys = plan.attribute_does_not_match_regex(allAccessKeys,
                      "pgp_key", "^keybase:(.+)", true)
```
