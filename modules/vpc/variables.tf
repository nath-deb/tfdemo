variable cidr_block {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "0.0.0.0/0"
}

variable common_tags {
  description = "Map of Common Tags"
  type        = map(string)
  default     = {}
}

variable common_name {
  description = "Tag Name value"
  type        = string
  default     = ""
}

variable resource_index {
  description = "Index of resources"
  type        = number
  default     = 0
}