resource "aws_iam_policy" "e5_fin_fsx" {
  name        = "e5_fin_fsx"
  description = "Allows management of FSx storage workloads"
  policy      = data.aws_iam_policy_document.e5_fin_fsx.json
}

resource "aws_iam_role" "e5_fin_fsx_role" {
  name = "e5_fin_fsx_role"

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

resource "aws_iam_role_policy_attachment" "attach_e5_fin_fsx_policy" {
  role       = aws_iam_role.e5_fin_fsx_role.name
  policy_arn = aws_iam_policy.e5_fin_fsx.arn
}
