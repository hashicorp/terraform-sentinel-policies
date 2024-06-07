module "tfplan-functions" {
  source = "../../../../common-functions/tfplan-functions/tfplan-functions.sentinel"
}

module "tfconfig-functions" {
  source = "../../../../common-functions/tfconfig-functions/tfconfig-functions.sentinel"
}

module "general-functions" {
  source = "../../../../common-functions/general-functions/general-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "mock-tfplan-fail-missing-vpce.sentinel"
  }
}

mock "tfconfig/v2" {
  module {
    source = "mock-tfconfig-fail-missing-vpce.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
