variable "roles" {
  type = list(object({
    assume_role_policy    = string                 # Policy that grants an entity permission to assume the role.
    description           = optional(string)       # Description of the role.
    force_detach_policies = optional(bool)         # Whether to force detaching any policies the role has before destroying it. Defaults to false.
    managed_policy_arns   = optional(list(string)) # Set of exclusive IAM managed policy ARNs to attach to the IAM role.
    max_session_duration  = optional(number)       # Maximum session duration (in seconds) that you want to set for the specified role.
    name                  = optional(string)       # (Forces new resource) Friendly name of the role.
    name_prefix           = optional(string)       # (Forces new resource) Friendly name of the role.
    path                  = optional(string)       # Path to the role.
    permissions_boundary  = optional(string)       # ARN of the policy that is used to set the permissions boundary for the role.
    tags                  = optional(map(string))  # Key-value mapping of tags for the IAM role.
    policies              = optional(list(string)) # List of IAM policies to attach
  }))
  description = "List of IAM roles."
  default     = [{ assume_role_policy = null }]
}
