variable "db_storage" {
  description = "Allocated storage for DB"
}

variable "db_name" {
  
}

variable "db_engine_version" {
  
}

variable "db_instance_class" {
  
}

variable "db_user" {
  
}

variable "db_password" {
  
}

variable "db_subnet_group_name" {
  
}

variable "vpc_security_group_ids" {
  
}

variable "db_identifier" {
  description = "Name of the RDS instance, required for point-in-time recovery"
}

variable "skip_db_snapshot" {
  default = true
}