locals {
  vpc_cidr = "10.123.0.0/16"
}

locals {
  security_groups = {
    public = {
        name = "tf_public_sg"
        description = "Security Group for public access"
        ingress = {
            ssh = {
                from = 22
                to = 22
                protocol = "tcp"
                cidr_blocks = [var.access_ip]
            }
            kube = {
                from = 8443
                to = 8443
                protocol = "tcp"
                cidr_blocks = [var.access_ip]
            }
            http = {
                from = 80
                to = 80
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
            }
            nginx = {
                from = 8000
                to = 8000
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
            }
        }
    }
    rds = {
        name = "rds_sg"
        description = "Security Group for Amazon RDS instance"
        ingress = {
            mssql = {
                from = 3306
                to = 3306
                protocol = "tcp"
                cidr_blocks = [local.vpc_cidr]
            }
        }
    }
  }
}