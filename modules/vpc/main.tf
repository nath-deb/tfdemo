resource "aws_vpc" "main" {
  cidr_block = var.cidr_block

  tags = merge(
    var.common_tags,
    map(
      "Name", "${var.common_name}-${var.resource_index}"
    )
  )
}