variable "policies" {
  type = list(object({
    description = optional(string)      # (Forces new resource) Description of the IAM policy.
    name        = optional(string)      # (Forces new resource) The name of the policy. If omitted, Terraform will assign a random, unique name.
    name_prefix = optional(string)      # (Forces new resource) Creates a unique name beginning with the specified prefix. Conflicts with name.
    path        = optional(string)      # Path in which to create the policy.
    policy      = string                # The policy document. This is a JSON formatted string.
    tags        = optional(map(string)) # Map of resource tags for the IAM Policy.
  }))
  description = "List of IAM polcies."
  default     = [{ policy = null }]
}
