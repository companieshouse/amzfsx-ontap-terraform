resource "aws_fsx_ontap_storage_virtual_machine" "nfs_svm" {
  file_system_id = aws_fsx_ontap_file_system.nfs_fsx.id
  name           = "nfs_svm"
}