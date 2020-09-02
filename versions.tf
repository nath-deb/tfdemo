terraform {
  required_version = "~> 0.13.1"
  # terraform version

  required_providers {
    aws = "~> 3.4.0"
    # aws provider version
    template = "~> 2.1.2"
    # used when you need to create multiple json files with different values
    local = "~> 1.4.0"
    # usually used for implementing feature toggles along with count  
    null = "~> 2.1.2"
    # used to put in dependencies between 2 resources; usually to be avoided
  }


  backend "s3" {
    region = "us-east-1"
    # s3 bucket region
    encrypt = true
    # encrypt bucket contents
    bucket = "surd-demo-terraform-dev"
    # s3 bucket name
    key = "terraform.tfstate"
    # terraform state file name
    # kms_key_id = "*****"
    # optional
    dynamodb_table = "terraform-lock"
    # dynamoDB table name
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
  # region where deployment/provisioning of infrastructure takes place
  # profile                 = "*****"
  # name of the aws profile
  # shared_credentials_file = "%HOMEPATH%//.aws//credentials"
  # Shared credententials file path in windows
}