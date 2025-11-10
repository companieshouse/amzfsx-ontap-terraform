locals {
  common_resource_name  = "${var.environment}-${var.fsx_fs_name}"
  fsx_admin_password    = data.vault_generic_secret.fsx_admin_password.data["fsx_admin_password"]
  netapp_account_id     = data.vault_generic_secret.netapp_account_id.data["account-id"]
  netapp_fsx_account_id = data.vault_generic_secret.netapp_fsx_account_id.data["account-id"]

  default_tags = {
    # Tags
    Name           = local.common_resource_name
    Repository     = "amzfsx-ontap-terraform"
    Service        = "NFS"
    ServiceSubType = "FSx"
    Team           = "Linux and Storage Support"
  }

}