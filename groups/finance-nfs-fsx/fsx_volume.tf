resource "aws_fsx_ontap_volume" "nfs_vol_01" {
  name                       = "nfs_vol_01"
  junction_path              = "/nfs_vol_01"
  size_in_megabytes          = 1024
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.nfs_svm.id

  tiering_policy {
    name           = "AUTO"
    cooling_period = 31
  }
}
