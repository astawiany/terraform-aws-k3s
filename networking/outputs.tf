output "vpc_id" {
  value = aws_vpc.tf_vpc.id
  description = "Id of the created VPC"
}