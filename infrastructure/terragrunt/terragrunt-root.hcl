# ---------------------------------------------------------------------------------------------------------------------
# Terragrunt root configuration.
#
# Usage:
#
#   include "root" {
#     path = find_in_parent_folders("terragrunt-root.hcl")
#   }
# ---------------------------------------------------------------------------------------------------------------------

locals {
  common_config = read_terragrunt_config(find_in_parent_folders("common-config.hcl"))
  env_config    = read_terragrunt_config(find_in_parent_folders("env-config.hcl"))
}

# ---------------------------------------------------------------------------------------------------------------------
# These resources are used by all environments in this project.
# ---------------------------------------------------------------------------------------------------------------------

remote_state {
  backend = "azurerm"

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite"
  }

  config  = {
    key                  = "${path_relative_to_include("root")}.tfstate"
    container_name       = "${local.env_config.locals.backend_storage_container_name}"
    resource_group_name  = "${local.env_config.locals.backend_resource_group_name}"
    storage_account_name = "${local.env_config.locals.backend_storage_account_name}"
    subscription_id      = "${local.env_config.locals.backend_subscription_id}"
  }
}
