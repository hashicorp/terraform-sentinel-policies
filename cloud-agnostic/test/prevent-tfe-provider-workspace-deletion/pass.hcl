# Copyright IBM Corp. 2022, 2026

mock "tfplan/v2" {
  module {
    source = "mock-tfplan-v2-pass.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}
