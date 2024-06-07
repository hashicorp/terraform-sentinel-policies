param "organization" {
  value = "Cloud-Operations"
}

param "token" {
  value = ""
}

module "general-functions" {
    source = "../../../../common-functions/general-functions/general-functions.sentinel"
}

module "tfconfig-functions" {
      source = "../../../../../common-functions/tfconfig-functions/tfconfig-functions.sentinel"
}

mock "tfconfig/v2" {
  module {
    source = "mock-tfconfig-pass-valid-constraints.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}
