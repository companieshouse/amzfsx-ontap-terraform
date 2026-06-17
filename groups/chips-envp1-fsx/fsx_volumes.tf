
resource "aws_fsx_ontap_volume" "chips_envp1_data_vol" {
  count = var.create_data_volumes ? var.chips_envp1_data_count : 0

  name                       = "chips_envp1_data_vol_${format("%02d", count.index + 1)}"
  junction_path              = "/chips_envp1_data_vol_${format("%02d", count.index + 1)}"
  size_in_megabytes          = var.chips_envp1_data_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.chips_envp1_svm.id

  tiering_policy {
    name = "NONE"
  }

  tags = merge(
    local.default_tags,
    tomap(
      {
        "Volume" = "CHIPS-OLTP-G2-DATA"
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

resource "aws_fsx_ontap_volume" "chips_envp1_lobdata_vol" {
  count = var.create_data_volumes ? var.chips_envp1_lobdata_count : 0

  name                       = "chips_envp1_lobdata_vol_${format("%02d", count.index + 1)}"
  junction_path              = "/chips_envp1_lobdata_vol_${format("%02d", count.index + 1)}"
  size_in_megabytes          = var.chips_envp1_lobdata_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.chips_envp1_svm.id

  tiering_policy {
    name = "NONE"
  }

  tags = merge(
    local.default_tags,
    tomap(
      {
        "Volume" = "CHIPS-OLTP-G2-DATA"
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

resource "aws_fsx_ontap_volume" "chips_envp1_arch_vol" {
  count = var.create_arch_volumes ? var.chips_envp1_arch_count : 0

  name                       = "chips_envp1_arch_vol_${format("%02d", count.index + 1)}"
  junction_path              = "/chips_envp1_arch_vol_${format("%02d", count.index + 1)}"
  size_in_megabytes          = var.chips_envp1_arch_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.chips_envp1_svm.id

  tiering_policy {
    name = "NONE"
  }

  tags = merge(
    local.default_tags,
    tomap(
      {
        "Volume" = "CHIPS-OLTP-G2-ARCHIVE-LOG"
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

resource "aws_fsx_ontap_volume" "chips_envp1_redo_vol" {
  count = var.create_redo_volumes ? var.chips_envp1_redo_count : 0

  name                       = "chips_envp1_redo_vol_${format("%02d", count.index + 1)}"
  junction_path              = "/chips_envp1_redo_vol_${format("%02d", count.index + 1)}"
  size_in_megabytes          = var.chips_envp1_redo_size
  storage_efficiency_enabled = true
  storage_virtual_machine_id = aws_fsx_ontap_storage_virtual_machine.chips_envp1_svm.id

  tiering_policy {
    name = "NONE"
  }

  tags = merge(
    local.default_tags,
    tomap(
      {
        "Volume" = "CHIPS-OLTP-G2-REDO"
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
