locals {
  common_resource_name      = "${var.aws_account}-${var.lambda_link_name}"
  common_role_resource_name = "${var.aws_account}-${var.lambda_link_name}-LambdaLinkRole"
}
