data "aws_iam_policy_document" "chips_oltp_fsx" {
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

resource "aws_iam_policy" "chips_oltp_fsx" {
  name        = "chips_oltp_fsx"
  description = "Allows management of FSx storage workloads"
  policy      = data.aws_iam_policy_document.chips_oltp_fsx.json
}

resource "aws_iam_role" "chips_oltp_fsx_role" {
  name = "chips_oltp_fsx_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : "sts:AssumeRole",
        "Principal" : {
          "AWS" : local.netapp_fsx_account_id
        },
        "Condition" : {
          "StringEquals" : {
            "sts:ExternalId" : local.netapp_account_id
          }
        }
      }
    ]
  })

}

resource "aws_iam_role_policy_attachment" "attach_chips_oltp_fsx_policy" {
  role       = aws_iam_role.chips_oltp_fsx_role.name
  policy_arn = aws_iam_policy.chips_oltp_fsx.arn
}
