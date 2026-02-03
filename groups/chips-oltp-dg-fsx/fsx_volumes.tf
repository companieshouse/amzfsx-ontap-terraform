resource "aws_fsx_ontap_volume" "chips_oltp_dg_data_vol" {
  count                      = var.chips_oltp_dg_data_count
  name                       = "chips_oltp_dg_data_vol_${format("%02d",count.index+1)}"
  size_in_megabytes          = var.chips_oltp_dg_data_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.chips_oltp_dg_svm.id

  tiering_policy {
    name = "NONE"
  }
}

resource "aws_fsx_ontap_volume" "chips_oltp_dg_fra_vol" {
  count                      = var.chips_oltp_dg_fra_count
  name                       = "chips_oltp_dg_fra_vol_${format("%02d",count.index+1)}"
  size_in_megabytes          = var.chips_oltp_dg_fra_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.chips_oltp_dg_svm.id

  tiering_policy {
    name = "NONE"
  }
}

resource "aws_fsx_ontap_volume" "chips_oltp_dg_redo_vol" {
  count                      = var.chips_oltp_dg_redo_count
  name                       = "chips_oltp_dg_redo_vol_${format("%02d",count.index+1)}"
  size_in_megabytes          = var.chips_oltp_dg_redo_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.chips_oltp_dg_svm.id

  tiering_policy {
    name = "NONE"
  }
}