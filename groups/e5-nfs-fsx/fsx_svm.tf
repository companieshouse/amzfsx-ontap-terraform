resource "aws_fsx_ontap_storage_virtual_machine" "e5_nfs_svm" {
  file_system_id = aws_fsx_ontap_file_system.e5_nfs_fsx.id
  name           = "e5_nfs_svm"

  #active_directory_configuration {
  #  netbios_name = "hdev-NFS-FSx"
  #  self_managed_active_directory_configuration {
  #    dns_ips     = local.dc_private_ips
  #    domain_name = local.domain_name
  #    password    = local.ad_password
  #    username    = local.ad_username
  #    organizational_unit_distinguished_name = local.ou_dn
  #  }
  #}

}