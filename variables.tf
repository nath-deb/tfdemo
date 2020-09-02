variable create_vpc {
  description = "VPC Flag to create/not create"
  type        = bool
  default     = true
}


variable cidr_block {
  description = "VPC CIDR Block"
  type        = string
  default     = "10.0.0.0/16"
}

variable opt_tag_name {
  description = "Common Tag Key Environment"
  type        = string
  default     = "Environment"
}

variable opt_tag_value {
  description = "Common Tag Value Environment"
  type        = string
  default     = "dev"
}

variable role {
  description = "Common Tag Value role"
  type        = string
  default     = "Admin"
}

variable common_name {
  description = "Passed to Resources under /modules/"
  type        = string
  default     = "Demo"
}