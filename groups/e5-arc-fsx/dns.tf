resource "aws_route53_record" "e5_arc_fsx_dns" {
  zone_id = data.aws_route53_zone.private_zone.id
  name    = var.fsx_fs_mgmt_dns_name
  type    = "A"
  ttl     = 300
  records = local.management_ip
}
