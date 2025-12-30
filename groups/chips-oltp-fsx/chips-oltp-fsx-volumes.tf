resource "aws_fsx_ontap_volume" "chips_oltp_data_vol_01" {
  name                       = "chips_oltp_data_vol_01"
  junction_path              = "/chips_oltp_data_vol_01"
  size_in_megabytes          = var.chips_oltp_data_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.chips_oltp_svm.id

  tiering_policy {
    name = "NONE"
  }
}

resource "aws_fsx_ontap_volume" "chips_oltp_data_vol_02" {
  name                       = "chips_oltp_data_vol_02"
  junction_path              = "/chips_oltp_data_vol_02"
  size_in_megabytes          = var.chips_oltp_data_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.chips_oltp_svm.id

  tiering_policy {
    name = "NONE"
  }
}

resource "aws_fsx_ontap_volume" "chips_oltp_data_vol_03" {
  name                       = "chips_oltp_data_vol_03"
  junction_path              = "/chips_oltp_data_vol_03"
  size_in_megabytes          = var.chips_oltp_data_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.chips_oltp_svm.id

  tiering_policy {
    name = "NONE"
  }
}

resource "aws_fsx_ontap_volume" "chips_oltp_data_vol_04" {
  name                       = "chips_oltp_data_vol_04"
  junction_path              = "/chips_oltp_data_vol_04"
  size_in_megabytes          = var.chips_oltp_data_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.chips_oltp_svm.id

  tiering_policy {
    name = "NONE"
  }
}

resource "aws_fsx_ontap_volume" "chips_oltp_data_vol_05" {
  name                       = "chips_oltp_data_vol_05"
  junction_path              = "/chips_oltp_data_vol_05"
  size_in_megabytes          = var.chips_oltp_data_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.chips_oltp_svm.id

  tiering_policy {
    name = "NONE"
  }
}

resource "aws_fsx_ontap_volume" "chips_oltp_data_vol_06" {
  name                       = "chips_oltp_data_vol_06"
  junction_path              = "/chips_oltp_data_vol_06"
  size_in_megabytes          = var.chips_oltp_data_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.chips_oltp_svm.id

  tiering_policy {
    name = "NONE"
  }
}

resource "aws_fsx_ontap_volume" "chips_oltp_fra_vol_01" {
  name                       = "chips_oltp_fra_vol_01"
  junction_path              = "/chips_oltp_fra_vol_01"
  size_in_megabytes          = var.chips_oltp_fra_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.chips_oltp_svm.id

  tiering_policy {
    name = "NONE"
  }
}

resource "aws_fsx_ontap_volume" "chips_oltp_fra_vol_02" {
  name                       = "chips_oltp_fra_vol_02"
  junction_path              = "/chips_oltp_fra_vol_02"
  size_in_megabytes          = var.chips_oltp_fra_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.chips_oltp_svm.id

  tiering_policy {
    name = "NONE"
  }
}

resource "aws_fsx_ontap_volume" "chips_oltp_fra_vol_03" {
  name                       = "chips_oltp_fra_vol_03"
  junction_path              = "/chips_oltp_fra_vol_03"
  size_in_megabytes          = var.chips_oltp_fra_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.chips_oltp_svm.id

  tiering_policy {
    name = "NONE"
  }
}

resource "aws_fsx_ontap_volume" "chips_oltp_fra_vol_04" {
  name                       = "chips_oltp_fra_vol_04"
  junction_path              = "/chips_oltp_fra_vol_04"
  size_in_megabytes          = var.chips_oltp_fra_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.chips_oltp_svm.id

  tiering_policy {
    name = "NONE"
  }
}

resource "aws_fsx_ontap_volume" "chips_oltp_redo_vol_01" {
  name                       = "chips_oltp_redo_vol_01"
  junction_path              = "/chips_oltp_redo_vol_01"
  size_in_megabytes          = var.chips_oltp_redo_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.chips_oltp_svm.id

  tiering_policy {
    name = "NONE"
  }
}

resource "aws_fsx_ontap_volume" "chips_oltp_redo_vol_02" {
  name                       = "chips_oltp_redo_vol_02"
  junction_path              = "/chips_oltp_redo_vol_02"
  size_in_megabytes          = var.chips_oltp_redo_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.chips_oltp_svm.id

  tiering_policy {
    name = "NONE"
  }
}

resource "aws_fsx_ontap_volume" "chips_oltp_redo_vol_03" {
  name                       = "chips_oltp_redo_vol_03"
  junction_path              = "/chips_oltp_redo_vol_03"
  size_in_megabytes          = var.chips_oltp_redo_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.chips_oltp_svm.id

  tiering_policy {
    name = "NONE"
  }
}

resource "aws_fsx_ontap_volume" "chips_oltp_redo_vol_04" {
  name                       = "chips_oltp_redo_vol_04"
  junction_path              = "/chips_oltp_redo_vol_04"
  size_in_megabytes          = var.chips_oltp_redo_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.chips_oltp_svm.id

  tiering_policy {
    name = "NONE"
  }
}
