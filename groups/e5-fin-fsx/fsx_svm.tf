resource "aws_fsx_ontap_storage_virtual_machine" "e5fin_svm" {
  file_system_id = aws_fsx_ontap_file_system.e5_fsx.id
  name           = "e5fin_svm"
}

resource "aws_fsx_ontap_storage_virtual_machine" "e5arc_svm" {
  file_system_id = aws_fsx_ontap_file_system.e5_fsx.id
  name           = "e5arc_svm"
}
