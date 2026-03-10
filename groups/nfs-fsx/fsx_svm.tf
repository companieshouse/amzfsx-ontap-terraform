resource "aws_fsx_ontap_storage_virtual_machine" "nfs_svm" {
  file_system_id = aws_fsx_ontap_file_system.nfs_fsx.id
  name           = "nfs_svm"

  active_directory_configuration {
    netbios_name = "hdev-NFS-FSx"
    self_managed_active_directory_configuration {
      dns_ips     = local.dc_private_ips
      domain_name = local.domain_name
      password    = local.ad_password
      username    = local.ad_username
    }
  }

}