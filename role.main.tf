resource "aws_iam_role" "name" {
  for_each = {
    for role in var.roles :
    coalesce(role.name, role.name_prefix) => role
    if role.assume_role_policy != null
  }

  assume_role_policy    = each.value.assume_role_policy
  description           = each.value.description
  force_detach_policies = each.value.force_detach_policies
  managed_policy_arns   = each.value.managed_policy_arns
  max_session_duration  = each.value.max_session_duration
  name                  = each.value.name
  name_prefix           = each.value.name_prefix
  path                  = each.value.path
  permissions_boundary  = each.value.permissions_boundary
  tags                  = each.value.tags
}
