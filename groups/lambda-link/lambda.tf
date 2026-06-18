resource "aws_lambda_function" "lambda_function" {
  function_name = local.common_resource_name
  image_uri     = "052582346341.dkr.ecr.${var.aws_region}.amazonaws.com/fsx_link:production"

  role = aws_iam_role.lambda_role.arn
  vpc_config {
    security_group_ids = [aws_security_group.fsx_lambda_link.id]
    subnet_ids         = data.aws_subnets.storage_subnets.ids
  }

  package_type = "Image"
  timeout      = 10

}

resource "aws_lambda_permission" "invoke_permission" {
  function_name = aws_lambda_function.lambda_function.function_name
  action        = "lambda:InvokeFunction"
  principal     = "arn:aws:iam::052582346341:root"
}

resource "aws_lambda_permission" "get_function_permission" {
  function_name = aws_lambda_function.lambda_function.function_name
  action        = "lambda:GetFunction"
  principal     = "arn:aws:iam::052582346341:root"
}

resource "aws_lambda_permission" "update_function_code_permission" {
  function_name = aws_lambda_function.lambda_function.function_name
  action        = "lambda:UpdateFunctionCode"
  principal     = "arn:aws:iam::052582346341:root"
}

output "lambda_function_arn" {
  description = "ARN of the Lambda function"
  value       = aws_lambda_function.lambda_function.arn
}
