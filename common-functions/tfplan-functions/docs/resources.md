# [resources](../tfplan-functions.sentinel#L21)
This function finds all resource instances of a specific type in the current plan that are being created, modified or read using the [tfplan/v2](https://www.terraform.io/docs/cloud/sentinel/import/tfplan-v2.html) import. Resources with the "no-op" action are also included, but only if their `change.after` attribute is not null.

## Sentinel Module
This function is contained in the [tfplan-functions.sentinel](../tfplan-functions.sentinel) module.

## Declaration
`func resources(type)`

## Arguments
* **type**: the type of resource to find, given as a string.

## Common Functions Used
None

## What It Returns
This function returns a single flat map of resource instances indexed by the complete [addresses](https://www.terraform.io/docs/internals/resource-addressing.html) of the instances. The map is actually a filtered sub-collection of the [`tfplan.resource_changes`](https://www.terraform.io/docs/cloud/sentinel/import/tfplan-v2.html#the-resource_changes-collection) collection.

## What It Prints
This function does not print anything.

## Examples
Here are some examples of calling this function, assuming that the tfplan-functions.sentinel file that contains it has been imported with the alias `plan`:
```
allEC2Instances = plan.resources("aws_instance")

allAzureVMs = plan.resources("azurerm_virtual_machine")

allGCEInstances = plan.resources("google_compute_instance")

allVMs = plan.resources("vsphere_virtual_machine")
```

This function is used by many policies including [restrict-ec2-instance-type.sentinel (AWS)](../../../aws/restrict-ec2-instance-type.sentinel), [restrict-vm-size..sentinel (Azure)](../../../azure/restrict-vm-size..sentinel), [restrict-gce-machine-type.sentinel (GCP)](../../../gcp/restrict-gce-machine-type.sentinel), and [restrict-vm-cpu-and-memory.sentinel (VMware)](../../../vmware/restrict-vm-cpu-and-memory.sentinel).
