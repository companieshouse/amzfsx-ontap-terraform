resource "aws_iam_role_policy_attachment" "lambda_basic_execution_policy_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaRole"
}

resource "aws_iam_role_policy" "LambdaPolicy" {
  name = "FSX-LambdaPolicy"
  role = aws_iam_role.lambda_role.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:CreateNetworkInterface",
          "ec2:DescribeNetworkInterfaces",
          "ec2:DeleteNetworkInterface",
          "ec2:AssignPrivateIpAddresses",
          "ec2:UnassignPrivateIpAddresses",
          "lambda:CreateFunction",
          "lambda:UpdateFunctionCode",
          "lambda:UpdateFunctionConfiguration"
        ]
        Resource = "*"
      }
    ]
  })
}


resource "aws_iam_role" "lambda_role" {
  name = "FSX-LambdaLinkRole-lambda-BMvc46f"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_lambda_function" "lambda_function" {
  function_name = "FSX-lambda-BMvc46f"
  image_uri     = "052582346341.dkr.ecr.${var.aws_region}.amazonaws.com/fsx_link:production"

  role = aws_iam_role.lambda_role.arn
  vpc_config {
    security_group_ids = var.security_group_ids
    subnet_ids         = var.subnet_ids
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
