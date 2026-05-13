resource "aws_fsx_ontap_volume" "e5fin_data_vol" {
  count                      = var.e5fin_data_count
  name                       = "e5fin_data_vol_${format("%02d", count.index + 1)}"
  junction_path              = "/e5fin_data_vol_${format("%02d", count.index + 1)}"
  size_in_megabytes          = var.e5fin_data_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.e5fin_svm.id


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

resource "aws_fsx_ontap_volume" "e5fin_fra_vol" {
  count                      = var.e5fin_fra_count
  name                       = "e5fin_fra_vol_${format("%02d", count.index + 1)}"
  junction_path              = "/e5fin_fra_vol_${format("%02d", count.index + 1)}"
  size_in_megabytes          = var.e5fin_fra_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.e5fin_svm.id


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

resource "aws_fsx_ontap_volume" "e5fin_redo_vol" {
  count                      = var.e5fin_redo_count
  name                       = "e5fin_redo_vol_${format("%02d", count.index + 1)}"
  junction_path              = "/e5fin_redo_vol_${format("%02d", count.index + 1)}"
  size_in_megabytes          = var.e5fin_redo_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.e5fin_svm.id


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

resource "aws_fsx_ontap_volume" "e5arc_data_vol" {
  count                      = var.e5arc_data_count
  name                       = "e5arc_data_vol_${format("%02d", count.index + 1)}"
  junction_path              = "/e5arc_data_vol_${format("%02d", count.index + 1)}"
  size_in_megabytes          = var.e5arc_data_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.e5arc_svm.id


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

resource "aws_fsx_ontap_volume" "e5arc_fra_vol" {
  count                      = var.e5arc_fra_count
  name                       = "e5arc_fra_vol_${format("%02d", count.index + 1)}"
  junction_path              = "/e5arc_fra_vol_${format("%02d", count.index + 1)}"
  size_in_megabytes          = var.e5arc_fra_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.e5arc_svm.id


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

resource "aws_fsx_ontap_volume" "e5arc_redo_vol" {
  count                      = var.e5arc_redo_count
  name                       = "e5arc_redo_vol_${format("%02d", count.index + 1)}"
  junction_path              = "/e5arc_redo_vol_${format("%02d", count.index + 1)}"
  size_in_megabytes          = var.e5arc_redo_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.e5arc_svm.id


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
