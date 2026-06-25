resource "aws_fsx_ontap_storage_virtual_machine" "e5_nfs_svm" {
  file_system_id = aws_fsx_ontap_file_system.e5_nfs_fsx.id
  name           = "e5_nfs_svm"

  lifecycle {
    ignore_changes = [active_directory_configuration]
  }
}
