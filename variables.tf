# VPC CIDR Block
variable cidr_block {
    default = "10.0.0.0/16"
}

variable profile {
   description = "IAM profile which has the same shared credentials mentioned below."
}

variable shared_credentials_file {
    description = "AWS Access Key and AWS Secret Access Key"
}