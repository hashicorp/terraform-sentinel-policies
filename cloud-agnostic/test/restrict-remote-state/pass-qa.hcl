# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

module "tfstate-functions" {
  source = "../../../common-functions/tfstate-functions/tfstate-functions.sentinel"
}

mock "tfstate/v2" {
  module {
    source = "mock-tfstate-pass-qa.sentinel"
  }
}

mock "tfrun" {
  module {
    source = "mock-tfrun-pass-qa.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}
