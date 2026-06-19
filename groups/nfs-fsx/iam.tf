resource "aws_iam_policy" "nfs_fsx" {
  name        = "nfs_fsx"
  description = "Allows management of FSx storage workloads"
  policy      = data.aws_iam_policy_document.nfs_fsx.json
}

resource "aws_iam_role" "nfs_fsx_role" {
  name = "nfs_fsx_role"

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

resource "aws_iam_role_policy_attachment" "attach_nfs_fsx_policy" {
  role       = aws_iam_role.nfs_fsx_role.name
  policy_arn = aws_iam_policy.nfs_fsx.arn
}
