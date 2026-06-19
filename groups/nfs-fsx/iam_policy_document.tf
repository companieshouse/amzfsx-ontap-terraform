data "aws_iam_policy_document" "nfs_fsx" {
  statement {
    actions = [
      "fsx:DescribeFileSystems",
      "fsx:DescribeStorageVirtualMachines",
      "fsx:DescribeVolumes",
      "fsx:ListTagsForResource",
      "fsx:DescribeBackups",
      "fsx:DescribeSharedVpcConfiguration",
      "cloudwatch:GetMetricData",
      "cloudwatch:GetMetricStatistics",
      "ec2:DescribeInstances",
      "ec2:DescribeVolumes",
      "elasticfilesystem:DescribeFileSystems",
      "ce:GetCostAndUsage",
      "ce:GetTags",
      "ce:GetCostAndUsageWithResources",
      "ce:GetCostForecast",
      "ce:GetUsageForecast"
    ]
    resources = ["*"]
  }


  statement {
    actions = [
      "fsx:CreateVolume",
      "fsx:DeleteVolume",
      "fsx:UpdateFileSystem",
      "fsx:UpdateStorageVirtualMachine",
      "fsx:UpdateVolume",
      "fsx:CreateBackup",
      "fsx:CreateVolumeFromBackup",
      "fsx:DeleteBackup",
      "fsx:TagResource",
      "fsx:UntagResource",
      "bedrock:InvokeModelWithResponseStream",
      "bedrock:InvokeModel",
      "bedrock:ListInferenceProfiles",
      "bedrock:GetInferenceProfile"
    ]
    resources = ["*"]
  }


  statement {
    actions = [
      "fsx:CreateFileSystem",
      "fsx:CreateStorageVirtualMachine",
      "fsx:DeleteFileSystem",
      "fsx:DeleteStorageVirtualMachine",
      "fsx:TagResource",
      "fsx:UntagResource",
      "kms:CreateGrant",
      "iam:CreateServiceLinkedRole",
      "ec2:CreateSecurityGroup",
      "ec2:CreateTags",
      "ec2:DescribeVpcs",
      "ec2:DescribeSubnets",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeRouteTables",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DescribeVolumeStatus",
      "kms:DescribeKey",
      "kms:ListKeys",
      "kms:ListAliases"
    ]
    resources = ["*"]
  }


  statement {
    actions = [
      "ec2:AuthorizeSecurityGroupEgress",
      "ec2:AuthorizeSecurityGroupIngress",
      "ec2:RevokeSecurityGroupEgress",
      "ec2:RevokeSecurityGroupIngress",
      "ec2:DeleteSecurityGroup"
    ]
    resources = ["*"]
    condition {
      test     = "StringLike"
      variable = "ec2:ResourceTag/AppCreator"
      values   = ["NetappFSxWF"]
    }
  }


  statement {
    actions = [
      "iam:SimulatePrincipalPolicy"
    ]
    resources = ["*"]
  }
}