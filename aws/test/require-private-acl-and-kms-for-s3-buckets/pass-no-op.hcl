# Copyright IBM Corp. 2022, 2026

module "tfplan-functions" {
  source = "../../../common-functions/tfplan-functions/tfplan-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "mock-tfplan-pass-no-op.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}
