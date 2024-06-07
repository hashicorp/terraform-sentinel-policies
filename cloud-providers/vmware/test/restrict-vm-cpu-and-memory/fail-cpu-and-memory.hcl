module "tfplan-functions" {
  source = "../../../../common-functions/tfplan-functions/tfplan-functions.sentinel"
}

module "general-functions" {
    source = "../../../../common-functions/general-functions/general-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "mock-tfplan-fail-cpu-and-memory.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
