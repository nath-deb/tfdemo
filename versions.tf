terraform {
  required_version = "~> 0.12.20"       //terraform version

  required_providers {
    aws      = "~> 2.69"                //aws provider version
    template = "~> 2.1.2"               //used when you need to create multiple json files with different values
    local    = "~> 1.4"                 //for local variables; usually used to act as a 
    null     = "~> 2.0"                 //for null resources; used to put in dependencies between 2 resources
  }

  backend "s3" {
    region  = <s3-region>               //s3 bucket region
    encrypt = true                      //encrypt bucket contents
    bucket  = <s3-bucket-name>          //s3 bucket name
    key     = "terraform.tfstate"       //terraform state file name
    kms_key_id = <kms key arn>          //Optional
    dynamodb_table = "terraform-lock"   //DynamoDB table name
  }
}

provider "aws" {
  region    = "us-east-2"               //region where deployment/provisioning of infrastructure takes place
}