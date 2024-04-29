# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

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
