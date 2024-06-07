module "tfplan-functions" {
  source = "../../../../common-functions/tfplan-functions/tfplan-functions.sentinel"
}

module "general-functions" {
    source = "../../../../common-functions/general-functions/general-functions.sentinel"
}

module "gcp-functions" {
  source = "../../gcp-functions/gcp-functions.sentinel"
}

mock "tfplan/v2" {
  module {
    source = "mock-tfplan-pass.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}
