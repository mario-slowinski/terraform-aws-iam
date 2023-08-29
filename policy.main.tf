resource "aws_iam_policy" "name" {
  for_each = {
    for policy in var.policies :
    coalesce(policy.name, policy.name_prefix) => policy
    if policy.policy != null
  }

  description = each.value.description
  name        = each.value.name
  name_prefix = each.value.name_prefix
  path        = each.value.path
  policy      = each.value.policy
  tags        = each.value.tags
}
