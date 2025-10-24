resource "aws_fsx_ontap_volume" "chips_vol_01" {
  name                       = "chips-vol-01"
  junction_path              = "/chips-vol-01"
  size_in_megabytes          = 1024
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.chips_svm.id

  tiering_policy {
    name           = "AUTO"
    cooling_period = 31
  }
}
