resource "aws_fsx_ontap_storage_virtual_machine" "e5_fin_svm" {
  file_system_id = aws_fsx_ontap_file_system.e5_fin_fsx.id
  name           = "e5_fin_svm"
}