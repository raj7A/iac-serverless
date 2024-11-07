locals {
  github_oidc_already_exists = true
}
resource "aws_iam_openid_connect_provider" "default" {
  count = local.github_oidc_already_exists ? 0 : 1
  url   = "https://token.actions.githubusercontent.com"
  client_id_list = [
    "sts.amazonaws.com",
  ]
  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1", "1c58a3a8518e8759bf075b76b750d4f2df264fcd"]
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

resource "aws_iam_role" "github_actions_role" {
  name = format("%s-github-actions-role", var.prefix)

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = format("arn:aws:iam::%s:oidc-provider/token.actions.githubusercontent.com", data.aws_caller_identity.current.id)
        }
        Action = "sts:AssumeRoleWithWebIdentity",
        Condition = {
          "StringLike" : {
            "token.actions.githubusercontent.com:sub" : format("repo:%s:*", var.repo_name)
          },
          "ForAllValues:StringEquals" : {
            "token.actions.githubusercontent.com:iss" : "https://token.actions.githubusercontent.com",
            "token.actions.githubusercontent.com:aud" : "sts.amazonaws.com"
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy" "extra_permissions" {
  name = "extra_permissions"
  role = aws_iam_role.github_actions_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        "Effect" : "Allow",
        "Action" : [
          "dynamodb:*",
        ],
        "Resource" : format("arn:aws:dynamodb:%s:%s:table/%s-tfstate-locks*", data.aws_region.current.id, data.aws_caller_identity.current.id, var.prefix)
      },
      {
        "Effect" : "Allow",
        "Action" : [
          "s3:*",
        ],
        "Resource" : [
          "arn:aws:s3:::${var.prefix}-tfstate",
          "arn:aws:s3:::${var.prefix}-tfstate/*",
          "arn:aws:s3:::user-details-static-contents"
        ]
      },
      {
        "Effect" : "Allow",
        "Action" : "s3:ListAllMyBuckets",
        "Resource" : "*"
      }
    ]
  })

}

resource "aws_iam_role_policy_attachments_exclusive" "exclusive_policies" {
  role_name   = aws_iam_role.github_actions_role.name
  policy_arns = ["arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"]
}