resource "aws_iam_account_alias" "alias" {
  for_each = var.account_alias != null ? toset([var.account_alias]) : toset([])

  account_alias = lower(each.value)
}
