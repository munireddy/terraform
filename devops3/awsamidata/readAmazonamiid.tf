##################################################################################
# VARIABLES
##################################################################################

#variable "aws_access_key" {}
#variable "aws_secret_key" {}
#variable "private_key_path" {}
#variable "key_name" {}
variable "region" {
  default = "us-east-2"
}

##################################################################################
# PROVIDERS
##################################################################################

provider "aws" {
 # access_key = var.aws_access_key
 # secret_key = var.aws_secret_key
  region     = var.region
}

##################################################################################
# DATA
##################################################################################

data "aws_ami" "aws-linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["*amzn*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


output "aws_ami_id" {
  value = data.aws_ami.aws-linux.id
}
