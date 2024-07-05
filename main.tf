# Configure the AWS Provider
provider "aws" {
  region  = "us-east-1"
  profile = "my_user_love"
}

# # Creating a new instance 
# resource "aws_instance" "test" {
#   ami           = "ami-0c55b159cbfafe1f0" # Replace with a valid AMI ID
#   instance_type = "t2.micro"
#   tags = {
#     Name = "test-spot-hasan"
#   }
# }

# VPC 
resource "aws_vpc" "vpc-hasan" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "terrafrom_vpc"
  }
}

# Subnets
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.vpc-hasan.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "private"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.vpc-hasan.id
  cidr_block = "10.0.10.0/24"
  tags = {
    Name = "public"
  }
}

# S3 bucket 
resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket2345678"
  tags = {
    Name        = "terafform_bucket"
    Environment = "test"
  }
}
