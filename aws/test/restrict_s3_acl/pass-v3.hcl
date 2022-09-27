#------------------------------------------------------------------------------
# Sentinel Modules (function imports)
#------------------------------------------------------------------------------
mock "tfplan-functions" {
  module {
    source = "../../functions/tfplan-functions.sentinel"
  }
}

mock "tfconfig-functions" {
  module {
    source = "../../functions/tfconfig-functions.sentinel"
  }
}

#------------------------------------------------------------------------------
# Sentinel Mocks
#------------------------------------------------------------------------------
mock "tfplan/v2" {
  module {
    source = "mock-tfplan-pass-v3.sentinel"
  }
}

mock "tfconfig/v2" {
  module {
    source = "mock-tfconfig-pass-v3.sentinel"
  }
}

#------------------------------------------------------------------------------
# Result
#------------------------------------------------------------------------------
test {
  rules = {
    main = true
  }
}