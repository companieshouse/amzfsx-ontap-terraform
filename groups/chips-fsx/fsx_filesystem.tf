resource "aws_fsx_ontap_file_system" "chips_fsx" {
  storage_capacity    = var.fsx_storage_capacity
  subnet_ids          = [values(data.aws_subnet.storage_subnet)[0].id, values(data.aws_subnet.storage_subnet)[1].id]
  deployment_type     = var.fsx_deployment_type
  throughput_capacity = var.fsx_throughput_capacity
  preferred_subnet_id = values(data.aws_subnet.storage_subnet)[0].id
}
