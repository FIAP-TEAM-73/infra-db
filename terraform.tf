# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

terraform {

  cloud {
    organization = "FIAP-TEAM-73"

    workspaces {
      name = "terraform-infra-db"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.31.0"
    }
  }

  required_version = "~> 1.2"
}
