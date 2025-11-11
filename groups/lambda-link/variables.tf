variable "aws_account" {
  type        = string
  description = "The name of the AWS account in which resources will be provisioned."
}

variable "aws_region" {
  type        = string
  description = "The AWS region in which resources will be created."
}

variable "environment" {
  type        = string
  description = "The environment name to be used when provisioning AWS resources."
  #default     = ""
}

variable "lambda_link_name" {
  type        = string
  description = "The name of the lambda link function"
}

variable "repo" {
  description = "Github Repository where code resides"
  type        = string
  default     = ""
}

variable "service" {
  type        = string
  description = "The service name to be used when creating AWS resources."
  default     = ""
}

variable "service_subtype" {
  type        = string
  description = "The service subtype name to be used when creating AWS resources."
  default     = ""
}

variable "team" {
  type        = string
  description = "The team name for ownership of this service."
  default     = "Linux and Storage Support"
}

variable "vpc_id" {
  description = "VPC ID for Lambda-link function"
  type        = string
  default     = "vpc-072a23b32e2695955"
}

variable "subnet_ids" {
  description = "List of subnet IDs for Lambda-link function"
  type        = list(string)
  default     = ["subnet-0253a321586aa3ff3"]
}

variable "security_group_ids" {
  description = "List of security group IDs for Lambda-link function"
  type        = list(string)
  default     = ["sg-0dded47534e6fc2ad"]
}
