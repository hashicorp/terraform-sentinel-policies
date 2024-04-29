# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

mock "tfplan/v2" {
  module {
    source = "mock-tfplan-v2-pass.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}
