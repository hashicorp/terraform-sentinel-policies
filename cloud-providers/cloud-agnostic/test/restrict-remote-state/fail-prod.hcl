module "tfstate-functions" {
  source = "../../../../common-functions/tfstate-functions/tfstate-functions.sentinel"
}

module "general-functions" {
  source = "../../../../common-functions/general-functions/general-functions.sentinel"
}

mock "tfstate/v2" {
  module {
    source = "mock-tfstate-fail-prod.sentinel"
  }
}

mock "tfrun" {
  module {
    source = "mock-tfrun-fail-prod.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
