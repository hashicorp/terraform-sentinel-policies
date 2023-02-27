# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

module "tfstate-functions" {
  source = "../../../common-functions/tfstate-functions/tfstate-functions.sentinel"
}

mock "tfstate/v2" {
  module {
    source = "mock-tfstate-pass-prod.sentinel"
  }
}

mock "tfrun" {
  module {
    source = "mock-tfrun-pass-prod.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}
