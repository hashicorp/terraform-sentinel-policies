module "tfstate-functions" {
  source = "../../../../common-functions/tfstate-functions/tfstate-functions.sentinel"
}

module "general-functions" {
  source = "../../../../common-functions/general-functions/general-functions.sentinel"
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
