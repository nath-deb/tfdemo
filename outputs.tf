output vpc_id {
  description = "VPC IDs"
  value       = module.vpc.*.vpc_output
}

output eip_public_ip {
  description = "Public IPs"
  value       = module.eip.*.eip_output_public_ip
}