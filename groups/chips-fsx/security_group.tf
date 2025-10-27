resource "aws_security_group" "chips_fsx" {
  name        = local.common_resource_name
  description = "Security group for the ${var.name}"
  vpc_id      = data.aws_vpc.heritage.id

#  tags = merge(local.common_tags, {
#    Name = "${local.common_resource_name}"
#  })
}

resource "aws_vpc_security_group_ingress_rule" "fsx_ssh_https" {
  description       = "Allow SSH and HTTPS connectivity for ${var.name}"
  security_group_id = aws_security_group.chips_fsx.id
  prefix_list_id    = data.aws_ec2_managed_prefix_list.administration_cidr_ranges.id
  ip_protocol       = "tcp"
  for_each          = toset(["22", "443"])
  from_port         = each.value
  to_port           = each.value
}

resource "aws_vpc_security_group_ingress_rule" "fsx_iscsi" {
  count             = length(data.aws_subnets.storage_subnets.ids)
  description       = "Allow ISCSI connectivity for ${var.name}"
  security_group_id = aws_security_group.chips_fsx.id
  ip_protocol       = "tcp"
  cidr_ipv4         = values(data.aws_subnet.storage_subnet)[count.index].cidr_block
  from_port         = 3260
  to_port           = 3260
}

### Egress Rules

resource "aws_vpc_security_group_egress_rule" "fsx_all_out" {
  description       = "Allow outbound traffic"
  security_group_id = aws_security_group.chips_fsx.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}