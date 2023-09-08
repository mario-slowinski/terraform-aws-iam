resource "aws_iam_role_policy_attachment" "role-policy" {
  for_each = {
    for attachment in local.role_policy_attachments :
    "${attachment.role}-${attachment.policy}" => attachment
  }

  role       = each.value.role
  policy_arn = startswith(each.value.policy, "arn:aws:iam:") ? each.value.policy : local.policies[each.value.policy].arn
}
