terraform {
  source = "../../../../terraform//azure-container-registry"
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
  name                = "atomicnucleus"
  tags                = local.env_config.locals.tags
}
