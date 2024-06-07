module "tfplan-functions" {
  source = "../../../../common-functions/tfplan-functions/tfplan-functions.sentinel"
}

module "general-functions" {
  source = "../../../../common-functions/general-functions/general-functions.sentinel"
}

module "tfconfig-functions" {
  source = "../../../../common-functions/tfconfig-functions/tfconfig-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "mock-tfplan-fail.sentinel"
  }
}

mock "tfconfig/v2" {
  module {
    source = "mock-tfconfig-fail.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
