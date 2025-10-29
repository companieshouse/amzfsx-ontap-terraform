data "aws_subnets" "storage_subnets" {
  filter {
    name   = "tag:Name"
    values = ["sub-storage-*"]
  }
}

data "aws_subnet" "storage_subnet" {
  for_each = toset(data.aws_subnets.storage_subnets.ids)
  id       = each.value
}

data "aws_vpc" "heritage" {
  filter {
    name   = "tag:Name"
    values = ["vpc-heritage-${var.environment}"]
  }
}

data "aws_ec2_managed_prefix_list" "administration_cidr_ranges" {
  name = "administration-cidr-ranges"
}

data "vault_generic_secret" "fsx_admin_password" {
  path = "applications/${var.aws_account}/amzfsx/chips-fsx"
}

data "vault_generic_secret" "netapp_account_id" {
  path = "applications/shared-services-eu-west-2/netapp/account"
}

data "vault_generic_secret" "netapp_fsx_account_id" {
  path = "applications/shared-services-eu-west-2/netapp/fsx/"
}