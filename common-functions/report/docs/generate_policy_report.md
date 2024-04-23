# [generate_policy_report](./report.sentinel#32)
This function returns the formatted string for the corresponding summary object given in the input.
Formatted string has the violations, if any, in the following format.

```
→ → Overall Result: false

This result means that not all resources passed the policy check and the protected behavior is not allowed.

Found 5 resource violations

→ Module name: aws_iam
   ↳ Resource Address: aws_iam_policy_example
     | ✗ failed
     | iam max age incorrect
   ↳ Resource Address: aws_iam_policy_example1
     | ✗ failed
     | iam max age incorrect
   ↳ Resource Address: aws_iam_policy_example2
     | ✗ failed
     | iam max age incorrect
   ↳ Resource Address: aws_iam_policy_example3
     | ✗ failed
     | iam max age incorrect
   ↳ Resource Address: aws_iam_policy_example4
     | ✗ failed
     | iam max age incorrect

```

If there are no violations, the following output gets printed

```
→ → Overall Result: true

This result means that all resources have passed the policy check for the policy iam_max_password_age

✓ Found 0 resource violations
```

## Sentinel Module
This function is contained in the [modules/report](./report.sentinel) module.

## Declaration
`generate_policy_report = func(summary)`

## Arguments
`summary` object similar to below.
```
summary = {
  "policy_name": "my_awesome_policy",
  "violations" : map violations as _, vc {
         {
              "name": vc.name,
              "module_address": vc.module_address,
              "address": vc.address,
              "message": "resource " + vc.address + " violated the policy"
         }
   }
}
```

## What It Returns
Returns the string containing summary object details as shown in the top. 

## What It Prints
This function does not print anything.

## Examples
This function is called like this
```
summary = {
  "policy_name": "my_awesome_policy",
  "violations" : map violations as _, vc {
         {
              "name": vc.name,
              "module_address": vc.module_address,
              "address": vc.address,
              "message": "resource " + vc.address + " violated the policy"
         }
   }
}
report.generate_policy_report(summary)
```
where violations is the array of violations