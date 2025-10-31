data "aws_iam_policy_document" "chips_fsx" {
  statement {
    actions = ["fsx:*",
      "ec2:Describe*",
      "ec2:CreateTags",
      "ec2:CreateSecurityGroup",
      "iam:CreateServiceLinkedRole",
      "kms:Describe*",
      "elasticfilesystem:Describe*",
      "kms:List*",
      "kms:CreateGrant",
      "cloudwatch:PutMetricData",
      "cloudwatch:GetMetricData",
      "cloudwatch:GetMetricStatistics"
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

resource "aws_iam_policy" "chips_fsx" {
  name        = "chips_fsx"
  description = "Allows management of FSx storage workloads"
  policy      = data.aws_iam_policy_document.chips_fsx.json
}

resource "aws_iam_role" "chips_fsx_role" {
  name = "chips_fsx_role"

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

resource "aws_iam_role_policy_attachment" "attach_chips_fsx_policy" {
  role       = aws_iam_role.chips_fsx_role.name
  policy_arn = aws_iam_policy.chips_fsx.arn
}