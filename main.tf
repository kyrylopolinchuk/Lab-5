provider "aws" {
  region     = "eu-north-1"
}

locals {
  instance_type  = "t3.micro"
  key_name       = "Lab5"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "3.0.0"

  name                    = "Kyrylo1-ec2-instance"
  ami                     = "ami-0014ce3e52359afbd"
  instance_type           = local.instance_type
  key_name                = local.key_name
  vpc_security_group_ids  = ["sg-01db92e3bb2f96cce"]
  subnet_id               = "subnet-06ca9b02a997d5595"

  root_block_device = [{
    volume_size = 16
  }]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

# module "s3_bucket" {
#   source  = "terraform-aws-modules/s3-bucket/aws"
#   version = "~> 3.0"

#   bucket = "kyrylo-module-bucket"
#   acl    = "private"

#   tags = {
#     Name        = "Kyrylo bucket"
#     Environment = "Dev"
#   }
# }
