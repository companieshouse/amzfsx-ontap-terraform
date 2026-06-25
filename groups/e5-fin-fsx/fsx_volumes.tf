resource "aws_fsx_ontap_volume" "e5_fin_data_vol" {
  count                      = var.create_data_volumes ? var.e5_fin_data_count : 0
  name                       = "e5_fin_data_vol_${format("%02d", count.index + 1)}"
  junction_path              = "/e5_fin_data_vol_${format("%02d", count.index + 1)}"
  size_in_megabytes          = var.e5_fin_data_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.e5_fin_svm.id


  tiering_policy {
    name = "NONE"
  }

  lifecycle {
    ignore_changes = [
      size_in_megabytes,
      junction_path
    ]
  }
}

resource "aws_fsx_ontap_volume" "e5_fin_fra_vol" {
  count                      = var.create_fra_volumes ? var.e5_fin_fra_count : 0
  name                       = "e5_fin_fra_vol_${format("%02d", count.index + 1)}"
  junction_path              = "/e5_fin_fra_vol_${format("%02d", count.index + 1)}"
  size_in_megabytes          = var.e5_fin_fra_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.e5_fin_svm.id


  tiering_policy {
    name = "NONE"
  }

  lifecycle {
    ignore_changes = [
      size_in_megabytes,
      junction_path
    ]
  }
}

resource "aws_fsx_ontap_volume" "e5_fin_redo_vol" {
  count                      = var.create_redo_volumes ? var.e5_fin_redo_count : 0
  name                       = "e5_fin_redo_vol_${format("%02d", count.index + 1)}"
  junction_path              = "/e5_fin_redo_vol_${format("%02d", count.index + 1)}"
  size_in_megabytes          = var.e5_fin_redo_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.e5_fin_svm.id


  tiering_policy {
    name = "NONE"
  }

  lifecycle {
    ignore_changes = [
      size_in_megabytes,
      junction_path
    ]
  }
}