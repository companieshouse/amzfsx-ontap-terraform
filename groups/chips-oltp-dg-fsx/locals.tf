locals {
  common_resource_name  = "${var.environment}-${var.fsx_fs_name}"
  fsx_admin_password    = data.vault_generic_secret.fsx_admin_password.data["fsx_admin_password"]
  netapp_account_id     = data.vault_generic_secret.netapp_account_id.data["account-id"]
  netapp_fsx_account_id = data.vault_generic_secret.netapp_fsx_account_id.data["account-id"]

  internal_fqdn = format("%s.%s.aws.internal", split("-", var.aws_account)[1], split("-", var.aws_account)[0])

  default_tags = {
    # Tags
    Name           = local.common_resource_name
    Repository     = "amzfsx-ontap-terraform"
    Service        = "CHIPS-OLTP-DG"
    ServiceSubType = "FSx"
    Team           = "Linux and Storage Support"
  }

}
