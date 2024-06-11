global "violations" {
  value = {
    resources = {
      foo = {
        address        = "foo.this"
        module_address = ""
      }
      bar = {
        address        = "module.foo.bar.this"
        module_address = "module.foo"
      }
    }
  }
}

import "module" "report" {
  source = "../../../report.sentinel"
}