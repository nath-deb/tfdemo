output vpc_output {
  description = "The ID of the VPC"
  value       = concat(aws_vpc.main.*.id, [""])[0]
}