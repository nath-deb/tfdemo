locals {
  common_tags = map(
    "${var.opt_tag_name}", "${var.opt_tag_value}",
    "role", "${var.role}"
  )
}

module vpc {
  source         = "./modules/vpc"
  count          = var.create_vpc ? 1 : 0
  cidr_block     = var.cidr_block
  common_tags    = local.common_tags
  common_name    = var.common_name
  resource_index = count.index
}

module eip {
  source         = "./modules/eip"
  count          = var.create_vpc ? 0 : 0
  common_tags    = local.common_tags
  common_name    = var.common_name
  resource_index = count.index
}