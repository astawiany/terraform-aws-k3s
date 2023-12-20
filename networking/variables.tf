variable "vpc_cidr" {
  type = string
}

variable "public_cidrs" {
  type = list
}

variable "private_cidrs" {
  type = list
}

variable "public_sn_count" {
  type = number
  description = "Number of the public subnets to be deployed"
}

variable "private_sn_count" {
  type = number
  description = "Number of the private subnets to be deployed"
}

variable "max_subnets" {
  type = number
  description = "Total number of subnets to be deployed"
}