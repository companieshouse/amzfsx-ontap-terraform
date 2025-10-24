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
}

variable "fsx_storage_capacity" {
  type = string
  description = "The storage capacity (GiB) of the file system"
}

variable "fsx_deployment_type" {
  type = string
  description = "The filesystem deployment type. Supports MULTI_AZ_1, MULTI_AZ_2, SINGLE_AZ_1, and SINGLE_AZ_2"
}

variable "fsx_throughput_capacity" {
  type = string
  description = " Sets the throughput capacity (in MBps) for the file system that you're creating. Valid values are 128, 256, 512, 1024, 2048, and 4096"
}
