output eip_output_public_ip {
    description = "The public ip"
    value = aws_eip.main.*.public_ip
}