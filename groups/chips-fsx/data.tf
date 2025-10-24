data "aws_subnets" "storage_subnets" {
  filter {
    name   = "tag:Name"
    values = ["sub-storage-*"]
  }
}

data "aws_subnet" "storage_subnet" {
  for_each = toset(data.aws_subnets.storage_subnets.ids)
  id       = each.value
}