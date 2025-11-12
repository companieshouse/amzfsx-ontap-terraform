locals {
  common_resource_name  = "${var.environment}-${var.fsx_fs_name}"
  fsx_admin_password    = data.vault_generic_secret.fsx_admin_password.data["fsx_admin_password"]
  netapp_account_id     = data.vault_generic_secret.netapp_account_id.data["account-id"]
  netapp_fsx_account_id = data.vault_generic_secret.netapp_fsx_account_id.data["account-id"]

  default_tags = {
    # Tags
    Name           = local.common_resource_name
    Repository     = var.repo
    Service        = var.service
    ServiceSubType = var.service_subtype
    Team           = "Linux and Storage Support"
  }

  application_cidr_blocks = [for subnet in data.aws_subnet.application_subnet : subnet.cidr_block]
  nfs_cidr_blocks         = concat(local.application_cidr_blocks)
  nfs_ingress_cidrs       = length(local.nfs_cidr_blocks) >= 1 ? setproduct(local.nfs_cidr_blocks, var.nfs_ports) : []
  
}