output "vpc_id" {
  value = aws_vpc.tf_vpc.id
  description = "Id of the created VPC"
}

output "db_subnet_group_name" {
  value = aws_db_subnet_group.tf_rds_sn_group.*.name
}

output "db_security_group" {
  value = [aws_security_group.tf_sg["rds"].id]
}

output "public_sg" {
  value = aws_security_group.tf_sg["public"].id
}

output "public_subnets" {
  value = aws_subnet.tf_public_subnet.*.id
}