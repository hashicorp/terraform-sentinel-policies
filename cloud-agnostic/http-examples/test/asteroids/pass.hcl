# Copyright IBM Corp. 2022, 2026

param "api_token" {
  value = ""
}

param "danger_distance" {
  value = 200000
}

test {
  rules = {
    main = true
  }
}
