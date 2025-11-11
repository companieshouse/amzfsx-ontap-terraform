### Ingress Rules

resource "aws_security_group" "fsx_lambda_link" {
  name        = local.common_resource_name
  description = "Security group for the ${var.lambda_link_name}"
  vpc_id      = data.aws_vpc.heritage.id
}

resource "aws_vpc_security_group_ingress_rule" "fsx_ssh" {
  count             = length(data.aws_subnets.storage_subnets.ids)
  description       = "Allow SSH connectivity ${var.lambda_link_name}"
  security_group_id = aws_security_group.fsx_lambda_link.id
  ip_protocol       = "tcp"
  cidr_ipv4         = values(data.aws_subnet.storage_subnet)[count.index].cidr_block
  from_port         = 22
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "fsx_https" {
  count             = length(data.aws_subnets.storage_subnets.ids)
  description       = "Allow HTTPS connectivity ${var.lambda_link_name}"
  security_group_id = aws_security_group.fsx_lambda_link.id
  ip_protocol       = "tcp"
  cidr_ipv4         = values(data.aws_subnet.storage_subnet)[count.index].cidr_block
  from_port         = 443
  to_port           = 443
}

### Egress Rules

resource "aws_vpc_security_group_egress_rule" "fsx_lambda_link_all_out" {
  description       = "Allow outbound traffic"
  security_group_id = aws_security_group.fsx_lambda_link.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

