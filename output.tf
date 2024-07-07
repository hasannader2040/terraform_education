#output "s3_arn" {
 # value = aws_s3_bucket.example.arn
#}

#output "myec2_instance_ip" {
 # value = aws_instance.test.private_ip
#}




# output "instance_ip_addr" {
#   value = aws_instance.example.public_ip
#   description = "the private Ip address pf the ,aom web server instance"

#   depends_on = [ 
#   aws_securty-group_role.local_access,
#    ]
# }

 

 
 output "elastic_ip" {
  value = aws_eip.ib.public_ip
}