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