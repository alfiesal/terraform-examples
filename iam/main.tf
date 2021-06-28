provider "aws" {
  profile = "default"
  region  = var.aws_region
}

resource "aws_iam_account_alias" "account_alias" {
  account_alias = "alfie-salomon-organization-name"
}

resource "aws_iam_account_password_policy" "strict" {
  minimum_password_length        = 8
  require_lowercase_characters   = true
  require_numbers                = true
  require_uppercase_characters   = true
  require_symbols                = true
  allow_users_to_change_password = true
  hard_expiry                    = true
  password_reuse_prevention      = 3
}

resource "aws_iam_user" "iam-users" {
  for_each = toset(var.iam_users)
  name     = each.key
}

resource "aws_iam_group" "iam-groups" {
  for_each = toset(var.iam_groups)
  name     = each.key
}

resource "aws_iam_group_membership" "assign-administrators" {
  name = "administrators-membership"

  users = [
    aws_iam_user.iam-users["alfie.salomons"].name
  ]

  group = aws_iam_group.iam-groups["administrators"].name
}

resource "aws_iam_group_membership" "assign-developers" {
  name = "developers-membership"

  users = [
    aws_iam_user.iam-users["terry.richardson"].name,
    aws_iam_user.iam-users["ricky.miller"].name,
  ]

  group = aws_iam_group.iam-groups["developers"].name
}

resource "aws_iam_group_policy_attachment" "administrators_policy" {
  group      = aws_iam_group.iam-groups["administrators"].name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_group_policy_attachment" "developers_policy" {
  for_each = toset([
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    "arn:aws:iam::aws:policy/IAMReadOnlyAccess"
  ])
  group = aws_iam_group.iam-groups["developers"].name

  policy_arn = each.value
}
