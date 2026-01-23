resource "aws_fsx_ontap_storage_virtual_machine" "snapshot_svm" {
  file_system_id = aws_fsx_ontap_file_system.snapshot_fsx.id
  name           = "snapshot_svm"
}
