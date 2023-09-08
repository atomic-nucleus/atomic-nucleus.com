terraform {
  source = "../../../../terraform//dns-zone"
}

include "root" {
  path = find_in_parent_folders("terragrunt-root.hcl")
}

locals {
  common_config = read_terragrunt_config(find_in_parent_folders("common-config.hcl"))
  env_config    = read_terragrunt_config(find_in_parent_folders("env-config.hcl"))
}

inputs = {
  resource_group_name = "rg-shared"

  dns_zone_name = "local.atomic-nucleus.com"
  dns_zone_tags = merge(local.env_config.locals.tags, {})

  dns_zone_a_records = [
    {
      name    = "@"
      records = ["127.0.0.1"]
    },
    {
      name    = "*"
      records = ["127.0.0.1"]
    },
  ]
}
