resource "aws_fsx_ontap_storage_virtual_machine" "chips_envp1rep_svm" {
  file_system_id = aws_fsx_ontap_file_system.chips_envp1rep_fsx.id
  name           = "chips_envp1rep_svm"
}
