# Configure the AWS Provider

terraform {
  required_providers {
    mycloud = {
      source  = "mycorp/mycloud"
      version = "5.4.0"
    }
  }
  required_version = "~1.4.0"
}


provider "aws" {
  region  = "us-east-1"
  profile = "my_user_love"
}

# Define a VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# Elastic IP
resource "aws_eip" "ib" {
  domain = "vpc"
}


# # VPC 
# resource "aws_vpc" "vpc-hasan" {
#   cidr_block = "10.0.0.0/16"
#   tags = {
#     Name = "terrafrom_vpc"
#   }
# }

# # Subnets
# resource "aws_subnet" "private" {
#   vpc_id     = aws_vpc.vpc-hasan.id
#   cidr_block = "10.0.1.0/24"
#   tags = {
#     Name = "private"
#   }
# }

# resource "aws_subnet" "public" {
#   vpc_id     = aws_vpc.vpc-hasan.id
#   cidr_block = "10.0.10.0/24"
#   tags = {
#     Name = "public"
#   }
# }

# # S3 bucket 
# resource "aws_s3_bucket" "example" {
#   bucket = "my-tf-test-bucket2345678"
#   tags = {
#     Name        = "terafform_bucket"
#     Environment = "test"
#   }
# }





// aws_nat_getway 

resource "aws_nat_gateway" "example" {
  allocation_id = aws_eip.ib.id
  subnet_id     = "subnet-07264c569d72857aa"

  tags = {
    Name = "gw NAT"
  }

  # # To ensure proper ordering, it is recommended to add an explicit dependency
  # # on the Internet Gateway for the VPC.
  # depends_on = [aws_internet_gateway.example]
}