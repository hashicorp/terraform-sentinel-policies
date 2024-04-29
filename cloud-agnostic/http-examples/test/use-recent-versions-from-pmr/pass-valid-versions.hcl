# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

param "address" {
  value = "app.terraform.io"
}

param "organizations" {
  value = ["Cloud-Operations", "CarolBerlind"]
}

param "token" {
  value = ""
}

param "version_limit" {
  value = 3
}

module "registry-functions" {
      source = "../../registry-functions/registry-functions.sentinel"
}

module "tfconfig-functions" {
      source = "../../../../common-functions/tfconfig-functions/tfconfig-functions.sentinel"
}

mock "tfconfig/v2" {
  module {
    source = "mock-tfconfig-pass-valid-versions.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}
