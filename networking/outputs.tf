output "vpc_id" {
  value = aws_vpc.terraform_vpc.id
  description = "Id of the created VPC"
}