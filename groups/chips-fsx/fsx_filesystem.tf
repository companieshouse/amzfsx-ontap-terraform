resource "aws_fsx_ontap_file_system" "chips_fsx" {
  storage_capacity    = var.fsx_storage_capacity
  subnet_ids          = can(regex("MULTI", var.fsx_deployment_type)) ? [values(data.aws_subnet.storage_subnet)[0].id, values(data.aws_subnet.storage_subnet)[1].id] : [values(data.aws_subnet.storage_subnet)[0].id]
  deployment_type     = var.fsx_deployment_type
  throughput_capacity = var.fsx_throughput_capacity
  preferred_subnet_id = values(data.aws_subnet.storage_subnet)[0].id
  fsx_admin_password  = local.fsx_admin_password
  security_group_ids  = [aws_security_group.chips_fsx.id]

 # tags = {
 #   Name           = var.name
 #   Environment    = var.environment
 #   Repository     = var.repo
 #   Service        = var.service
 #   ServiceSubType = var.service_subtype
 #   Team           = var.team
 # }

 tags = merge(
  local.default_tags,
  tomap(
    {
      "Account" = var.aws_account,
      "Environment" = var.environment
    }
  )
)

}






