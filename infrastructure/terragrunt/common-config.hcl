# ---------------------------------------------------------------------------------------------------------------------
# Variables that are common to all environments.
#
# Usage:
#
#   common_config = read_terragrunt_config(find_in_parent_folders("common-config.hcl"))
# ---------------------------------------------------------------------------------------------------------------------

locals {
  tags = {
    "ManagedBy"     = "Terragrunt/Terraform"
    "ManagedByRepo" = "https://github.com/atomic-nucleus/atomic-nucleus.com/"
  }
}
