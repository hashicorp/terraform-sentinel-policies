# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

param "organization" {
  value = "Cloud-Operations"
}

param "token" {
  value = ""
}

module "tfconfig-functions" {
      source = "../../../../common-functions/tfconfig-functions/tfconfig-functions.sentinel"
}

mock "tfconfig/v2" {
  module {
    source = "mock-tfconfig-pass-no-pmr-modules.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}
