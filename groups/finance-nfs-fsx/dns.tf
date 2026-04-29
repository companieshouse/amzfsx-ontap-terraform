resource "aws_route53_record" "finance_nfs_fsx_dns" {
  zone_id = data.aws_route53_zone.private_zone.id
  name    = var.fsx_fs_mgmt_dns_name
  type    = "A"
  ttl     = 300
  records = ["${tolist(aws_fsx_ontap_file_system.finance_nfs_fsx.endpoints[0].management[0].ip_addresses)[0]}"]
}
