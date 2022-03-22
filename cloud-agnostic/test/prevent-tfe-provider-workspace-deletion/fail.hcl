mock "tfplan/v2" {
  module {
    source = "mock-tfplan-v2-fail.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
