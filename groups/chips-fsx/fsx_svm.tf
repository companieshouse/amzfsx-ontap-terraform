resource "aws_fsx_ontap_storage_virtual_machine" "chips_svm" {
  file_system_id = aws_fsx_ontap_file_system.chips_fsx.id
  name           = "chips_svm"
}
