resource "aws_sns_topic" "snapshot_fsx" {
  count = var.monitoring ? 1 : 0

  name = "snapshot_fsx"
}

resource "aws_sns_topic_subscription" "snapshot_fsx_system_Subscription" {
  count = var.monitoring ? 1 : 0

  topic_arn = aws_sns_topic.snapshot_fsx[0].arn
  protocol  = "email"
  endpoint  = local.linux_sns_email


  depends_on = [
    aws_sns_topic.snapshot_fsx
  ]
}

resource "aws_sns_topic_subscription" "snapshot_fsx_system_Subscriptionhttps" {
  count = var.monitoring ? 1 : 0

  topic_arn = aws_sns_topic.snapshot_fsx[0].arn
  protocol  = "https"
  endpoint  = data.vault_generic_secret.sns_url.data["url"]


  depends_on = [
    aws_sns_topic.snapshot_fsx
  ]
}