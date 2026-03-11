locals {
  common_resource_name  = "${var.environment}-${var.fsx_fs_name}"
  fsx_admin_password    = data.vault_generic_secret.fsx_admin_password.data["fsx_admin_password"]
  netapp_account_id     = data.vault_generic_secret.netapp_account_id.data["account-id"]
  netapp_fsx_account_id = data.vault_generic_secret.netapp_fsx_account_id.data["account-id"]
  ad_password           = data.vault_generic_secret.ad_password.data["ad_password"]
  ad_username           = data.vault_generic_secret.ad_username.data["ad_username"]
  domain_name           = var.ad_domain_name
  ou_dn                 = var.ad_ou_dn

  internal_fqdn = format("%s.%s.aws.internal", split("-", var.aws_account)[1], split("-", var.aws_account)[0])

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
  
  active_directory_data = data.vault_generic_secret.active_directory_data.data
  domain_controllers    = jsondecode(local.active_directory_data["domain_controllers"])

  dc_private_ips = [
    for dc in local.domain_controllers :
    dc.private_ip
  ]

}