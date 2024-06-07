module "tfstate-functions" {
  source = "../../../../common-functions/tfstate-functions/tfstate-functions.sentinel"
}

module "general-functions" {
  source = "../../../../common-functions/general-functions/general-functions.sentinel"
}

mock "tfstate/v2" {
  module {
    source = "mock-tfstate-pass-invalid-workspace-name.sentinel"
  }
}

mock "tfrun" {
  module {
    source = "mock-tfrun-pass-invalid-workspace-name.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}
