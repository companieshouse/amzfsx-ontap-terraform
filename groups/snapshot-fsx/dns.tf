resource "aws_route53_record" "snapshot_fsx_dns" {
  zone_id = data.aws_route53_zone.private_zone.id
  name    = var.fsx_fs_mgmt_dns_name
  type    = "CNAME"
  ttl     = 300
  records = [aws_fsx_ontap_file_system.snapshot_fsx.endpoints[0].management[0].dns_name]
}
