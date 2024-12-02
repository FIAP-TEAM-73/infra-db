# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "rds_postgre_user" {
  description = "RDS PostgreSQL user for Backoffice APP"
}

variable "rds_postgre_password" {
  description = "RDS PostgreSQL password Backoffice APP"
}

variable "rds_postgre_payment_api_user" {
  description = "RDS PostgreSQL user for Payment API"
}

variable "rds_postgre_payment_api_password" {
  description = "RDS PostgreSQL password for Payment API"
}

variable "mongo_db_order_api_user" {
  description = "RDS PostgreSQL user for Order API"
}

variable "mongo_db_order_api_password" {
  description = "RDS PostgreSQL password for Order API"
}

variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.micro"
}

variable "instance_name" {
  description = "EC2 instance name"
  default     = "Provisioned by Terraform"
}

variable "account_id" {
  type        = string
  description = "AWS Academy account id"
}

