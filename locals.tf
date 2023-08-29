locals {
  roles    = { for name, role in aws_iam_role.name : name => role }
  policies = { for name, policy in aws_iam_policy.name : name => policy }
  role_policy_attachments = distinct(flatten([
    for role in var.roles : [
      for policy in role.policies : {
        role   = coalesce(role.name, role.name_prefix)
        policy = policy
      }
    ]
    if role.policies != null
  ]))
}
