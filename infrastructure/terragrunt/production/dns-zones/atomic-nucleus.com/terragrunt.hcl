dependency "local_dns_zone" {
  config_path = "../../../local/dns-zones/local.atomic-nucleus.com"

  mock_outputs_allowed_terraform_commands = ["validate"]
  mock_outputs = {
    name_servers = ["127.0.0.1"]
  }
}

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
  dns_zone_name       = "atomic-nucleus.com"
  dns_zone_tags       = local.env_config.locals.tags

  dns_zone_ns_records = [
    {
      name    = "local"
      records = dependency.local_dns_zone.outputs.name_servers
    }
  ]
}
