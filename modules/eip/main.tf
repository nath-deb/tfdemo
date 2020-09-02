resource "aws_eip" "main" {
  vpc  = true  

  tags = merge(
    var.common_tags,
    map(
        "Name", "${var.common_name}-${var.resource_index}"
    )
  )
}