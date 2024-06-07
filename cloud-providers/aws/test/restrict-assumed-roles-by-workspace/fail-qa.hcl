module "aws-functions" {
  source = "../../aws-functions/aws-functions.sentinel"
}

module "tfconfig-functions" {
  source = "../../../../common-functions/tfconfig-functions/tfconfig-functions.sentinel"
}

module "general-functions" {
  source = "../../../../common-functions/general-functions/general-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "mock-tfplan-fail-qa.sentinel"
  }
}

mock "tfconfig/v2" {
  module {
    source = "mock-tfconfig-fail-qa.sentinel"
  }
}

mock "tfrun" {
  module {
    source = "mock-tfrun-qa.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
