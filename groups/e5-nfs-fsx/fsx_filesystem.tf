resource "aws_fsx_ontap_file_system" "e5_nfs_fsx" {
  storage_capacity                = var.fsx_storage_capacity
  subnet_ids                      = local.storage_subnets
  deployment_type                 = var.fsx_deployment_type
  throughput_capacity             = var.fsx_throughput_capacity
  preferred_subnet_id             = values(data.aws_subnet.storage_subnet)[0].id
  fsx_admin_password              = local.fsx_admin_password
  security_group_ids              = [aws_security_group.e5_nfs_fsx.id, aws_security_group.e5_nfs_fsx_nfs.id, aws_security_group.e5_nfs_fsx_cifs.id]
  automatic_backup_retention_days = var.fsx_auto_backup_retention

  tags = merge(
    local.default_tags,
    tomap(
      {
        "Account"     = var.aws_account,
        "Environment" = var.environment
      }
    )
  )

}