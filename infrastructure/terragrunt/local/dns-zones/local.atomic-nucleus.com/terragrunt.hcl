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
  resource_group_name = "DefaultResourceGroup-CCAN"

  name = "local.atomic-nucleus.com"
  tags = merge(local.env_config.locals.tags, {})

  a_records = [
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
