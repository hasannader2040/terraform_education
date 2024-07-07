

# # Define a VPC
# resource "aws_vpc" "main" {
#   cidr_block = "10.0.0.0/16"
# }

# # Define a security group ingress rule
# resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
#   security_group_id = aws_security_group.allow_tls.id
#   cidr_ipv4         = aws_vpc.main.cidr_block
#   from_port         = 443
#   ip_protocol       = "tcp"
#   to_port           = 443
# }



# # Creating a new instance 
# resource "aws_instance" "ec2_terrafroms" {
#   ami           = "ami-06c68f701d8090592" # Replace with a valid AMI ID
#   instance_type = "t2.micro"
#   vpc_security_group_ids = [aws_security_group.allow_tls.id]
#   tags = {
#     Name = "test-spot-hasan"
#   }
# }


# Define a Security Group
resource "aws_security_group" "allow_tls" {
  vpc_id      = aws_vpc.main.id
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  tags = {
    Name = "allow_tls"
  }
}

# Ingress rule for IPv4
resource "aws_security_group_rule" "allow_tls_ipv4" {
  type              = "ingress"
  security_group_id = aws_security_group.allow_tls.id
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["${aws_eip.ib.public_ip}/32"]
}



