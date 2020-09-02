# https://www.hashicorp.com/blog/announcing-hashicorp-terraform-0-13/
## Terraform Demo Project
#### This is only a demo terraform project to get you started. 
#### It uses teraform 0.13 with aws provider to create a VPC & EIP.
#### Makes use of modules, variables and outputs.
#### Note how the variables and outputs pass from the root to the module folder.
#### It makes use of count with modules, a new feature of terraform 0.13


## To run make the following changes
#### For the versions please make changes to versions.tf
#### For the local configuration please add/change config/<env>.tfvars
#### For variables like name changes needed to variables.tf under root
#### For running it through CodePipeline/CodeBuild go through the buildspec.yml

## To add new feature
#### Add the module in the modules folder
#### Call the module from the root main.tf file

## Directory Structure
<img src="./assets/directory_structure.png">

## Pre-requisites for local system
#### ==============
#### 1. Download Teraform from https://www.terraform.io/downloads.html
#### ==============
#### 2. Add Terraform to PATH
#### ==============
#### 3. git clone https://github.com/SurdTechnologies/tfdemo.git
#### ==============
#### 4. cd tfdemo 
#### ==============
#### 5. Setup the backend to store the terraform state file
####    a. Create a S3 bucket where you would like to store your tfstate file
####    b. Put in a dummy terraform.tfstate file in the above bucket
####    c. Create a DynamoDB table with Primary partition key LockID (String)
####    d. (Optional) Create a KMS key if you are to use one
#### ==============
#### 6. Under tfdemo/config folder create a file named "<env>".tfvars which contains the following 2 lines
####    profile = "<profile-name>"
####    shared_credentials_file = "<credential-file-path>"
#### ==============
#### 7. Declare variables and put in the values for variables in versions.tf
####    "${BUCKET_NAME}"
####    "${KMS_KEY_ID}"
#### ==============
#### 8. Initialize your terraform project with the command
####    terraform init
#### ==============
#### 9. Check on terraform code
####    terraform fmt
####    terraform validate
#### ==============
#### 10. Dry run your code
####    terraform plan -var-file=./config/"<env>".tfvars -out=tfplan
#### ==============
#### 11. Provision your environment
####    terraform apply -var-file=./config/"<env>".tfvars "tfplan"
#### ==============
#### 12. Destroy the environment
####    terraform destroy -var-file=./config/"<env>".tfvars


## Pre-requisites for AWS CodePipeline/CodeBuild
#### ==============
<img src="./assets/code_pipeline_1.png">
<img src="./assets/code_pipeline_2.png">
<img src="./assets/code_pipeline_3.png">
<img src="./assets/code_pipeline_4.png">

#### ==============
#### 1. Setup the Codepipeline in the following order
####    - Codebuild pointing to buildspec.yml ( terraform plan )
####    - Manual approval
####    - Codebuild pointing to buildspec-after.yml ( terraform apply )
#### ==============
#### 2. The apply command is passed as TF_COMMAND environment variable in the 2nd Codebuild
#### ==============
#### 3. When need to destroy environment change the TF_COMMAND value to destroy
