# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

param "address" {
  value = "app.terraform.io"
}

param "organizations" {
  value = ["Cloud-Operations", "App-Operations"]
}

mock "tfconfig/v2" {
  module {
    source = "mock-tfconfig-fail.sentinel"
  }
}

mock "tfrun" {
  module {
    source = "mock-tfrun-fail.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
