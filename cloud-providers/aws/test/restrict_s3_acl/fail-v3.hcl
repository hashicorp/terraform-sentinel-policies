#------------------------------------------------------------------------------
# Sentinel Modules (function imports)
#------------------------------------------------------------------------------
mock "tfplan-functions" {
  module {
    source = "../../../../common-functions/tfplan-functions/tfplan-functions.sentinel"
  }
}

mock "general-functions" {
  module {
    source = "../../../../common-functions/general-functions/general-functions.sentinel"
  }
}

mock "tfconfig-functions" {
  module {
    source = "../../../../common-functions/tfconfig-functions/tfconfig-functions.sentinel"
  }
}

#------------------------------------------------------------------------------
# Sentinel Mocks
#------------------------------------------------------------------------------
mock "tfplan/v2" {
  module {
    source = "mock-tfplan-fail-v3.sentinel"
  }
}

mock "tfconfig/v2" {
  module {
    source = "mock-tfconfig-fail-v3.sentinel"
  }
}

#------------------------------------------------------------------------------
# Result
#------------------------------------------------------------------------------
test {
  rules = {
    main = false
  }
}

