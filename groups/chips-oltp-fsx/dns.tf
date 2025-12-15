resource "aws_route53_record" "chips_oltp_fsx_dns" {
  zone_id = data.aws_route53_zone.private_zone.id
  name    = var.fsx_dns_name
  type    = "CNAME"
  ttl     = 300
  records = [aws_fsx_ontap_storage_virtual_machine.chips_oltp_svm.endpoints[0].management[0].dns_name]
}
