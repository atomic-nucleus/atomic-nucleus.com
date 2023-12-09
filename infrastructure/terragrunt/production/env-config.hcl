# ---------------------------------------------------------------------------------------------------------------------
# Variables that are common to the production environment.
#
# Usage:
#
#   env_config = read_terragrunt_config(find_in_parent_folders("env-config.hcl"))
# ---------------------------------------------------------------------------------------------------------------------

locals {
  common_config = read_terragrunt_config(find_in_parent_folders("common-config.hcl"))

  backend_resource_group_name    = "DefaultResourceGroup-CCAN"
  backend_storage_account_name   = "sa00tf00tvdxmhgghsgevtln"
  backend_storage_container_name = "terraform-state"
  backend_subscription_id        = "42bf0527-ba43-4c35-b994-ab2a570a6492" # Visual Studio Enterprise

  environment = "Production"

  tags = merge(local.common_config.locals.tags, {
    "Environment" = local.environment
  })
}
