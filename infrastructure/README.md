# Atomic Nucleus infrastructure

This repository manages all infrastructure for atomic-nucleus.com.

## Requirements

This project has been tested with the following toolchain:

| Tool                                                                        | Version          |
| --------------------------------------------------------------------------- | ---------------- |
| [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)   | ≥ 2.50.x         |
| [Terraform](https://www.terraform.io/downloads.html)                        | ≥ 1.5.x, < 2.0.x |
| [Terragrunt](https://terragrunt.gruntwork.io/docs/getting-started/install/) | ≥ 0.46.x         |

## Quick start

1. Set the required environment variables:

   ``` sh
   export ARM_SUBSCRIPTION_ID="00000000-0000-0000-0000-000000000000"
   export ARM_TENANT_ID="00000000-0000-0000-0000-000000000000"
   export ARM_CLIENT_ID="00000000-0000-0000-0000-000000000000"
   export ARM_CLIENT_SECRET="XXXXX~YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY"
   ```
1. Run `terraform -chdir=bootstrap/ init` to initialize Terraform.
1. Run `terraform -chdir=bootstrap/ apply` to create the backend resource group, storage account, and storage container.
