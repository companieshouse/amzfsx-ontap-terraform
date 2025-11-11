locals {
  common_resource_name      = "${var.environment}-${var.lambda_link_name}"
  common_role_resource_name = "${var.environment}-${var.lambda_link_name}-LambdaLinkRole"
}
