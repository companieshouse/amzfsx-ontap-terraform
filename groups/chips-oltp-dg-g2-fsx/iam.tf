resource "aws_iam_policy" "chips_oltp_dg_g2_fsx" {
  name        = "chips_oltp_dg_g2_fsx"
  description = "Allows management of FSx storage workloads"
  policy      = data.aws_iam_policy_document.chips_oltp_dg_g2_fsx.json
}

resource "aws_iam_role" "chips_oltp_dg_g2_fsx_role" {
  name = "chips_oltp_dg_g2_fsx_role"

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

resource "aws_iam_role_policy_attachment" "attach_chips_oltp_dg_g2_fsx_policy" {
  role       = aws_iam_role.chips_oltp_dg_g2_fsx_role.name
  policy_arn = aws_iam_policy.chips_oltp_dg_g2_fsx.arn
}
