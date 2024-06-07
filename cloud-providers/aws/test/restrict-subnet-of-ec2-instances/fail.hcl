module "tfconfig-functions" {
  source = "../../../../common-functions/tfconfig-functions/tfconfig-functions.sentinel"
}

module "general-functions" {
  source = "../../../../common-functions/general-functions/general-functions.sentinel"
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
