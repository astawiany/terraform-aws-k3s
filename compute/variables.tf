variable "instance_count" {}
variable "instance_type" {}
variable "public_sg" {}
variable "public_subnets" {}
variable "vol_size" {
  description = "EC2 instance EBS volume size"
}
variable "key_name" {
  description = "Name of the SSH public key for EC2 instances"
}
variable "public_key_path" {
  description = "Path to the SSH public key"
  validation {
    condition = endswith(var.public_key_path, "pub")
    error_message = "Specify a public key - file ending with .pub"
  }
}
variable "user_data_path" {
  description = "Path to the user data template"
}
variable "db_endpoint" {}
variable "db_user" {}
variable "db_password" {}
variable "db_name" {}