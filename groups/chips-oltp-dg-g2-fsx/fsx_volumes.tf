resource "aws_fsx_ontap_volume" "chips_oltp_dg_g2_data_vol" {
  count                      = var.chips_oltp_dg_g2_data_count
  name                       = "chips_oltp_dg_g2_data_vol_${format("%02d", count.index + 1)}"
  junction_path              = "/chips_oltp_dg_g2_data_vol_${format("%02d", count.index + 1)}"
  size_in_megabytes          = var.chips_oltp_dg_g2_data_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.chips_oltp_dg_g2_svm.id

  tiering_policy {
    name = "NONE"
  }

  tags = merge(
    local.default_tags,
    tomap(
      {
        "Volume" = "CHIPS-OLTP-DG-G2-DATA"
      }
    )
  )

  lifecycle {
    ignore_changes = [
      size_in_megabytes,
      junction_path
    ]
  }
}

resource "aws_fsx_ontap_volume" "chips_oltp_dg_g2_fra_vol" {
  count                      = var.chips_oltp_dg_g2_fra_count
  name                       = "chips_oltp_dg_g2_fra_vol_${format("%02d", count.index + 1)}"
  junction_path              = "/chips_oltp_dg_g2_fra_vol_${format("%02d", count.index + 1)}"
  size_in_megabytes          = var.chips_oltp_dg_g2_fra_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.chips_oltp_dg_g2_svm.id

  tiering_policy {
    name = "NONE"
  }

  tags = merge(
    local.default_tags,
    tomap(
      {
        "Volume" = "CHIPS-OLTP-DG-G2-FRA"
      }
    )
  )

  lifecycle {
    ignore_changes = [
      size_in_megabytes,
      junction_path
    ]
  }
}

resource "aws_fsx_ontap_volume" "chips_oltp_dg_g2_redo_vol" {
  count                      = var.chips_oltp_dg_g2_redo_count
  name                       = "chips_oltp_dg_g2_redo_vol_${format("%02d", count.index + 1)}"
  junction_path              = "/chips_oltp_dg_g2_redo_vol_${format("%02d", count.index + 1)}"
  size_in_megabytes          = var.chips_oltp_dg_g2_redo_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.chips_oltp_dg_g2_svm.id

  tiering_policy {
    name = "NONE"
  }

  tags = merge(
    local.default_tags,
    tomap(
      {
        "Volume" = "CHIPS-OLTP-DG-G2-REDO"
      }
    )
  )

  lifecycle {
    ignore_changes = [
      size_in_megabytes,
      junction_path
    ]
  }
}