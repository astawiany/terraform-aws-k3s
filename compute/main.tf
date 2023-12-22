data "aws_ami" "server_ami" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
}

resource "random_id" "tf_node_id" {
  byte_length = 2
  count       = var.instance_count
  keepers = {
    key_name = var.key_name
  }
}

resource "aws_key_pair" "tf_keypair" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_instance" "tf_node" {
  depends_on    = [aws_key_pair.tf_keypair]
  count         = var.instance_count
  ami           = data.aws_ami.server_ami.id
  instance_type = var.instance_type

  tags = {
    Name = "tf-node-${random_id.tf_node_id[count.index].dec}"
  }
  key_name               = aws_key_pair.tf_keypair.id
  vpc_security_group_ids = [var.public_sg]
  subnet_id              = var.public_subnets[count.index]
  user_data = templatefile(var.user_data_path, {
    nodename   = "tf-node-${random_id.tf_node_id[count.index].dec}"
    db_endpoint = var.db_endpoint
    dbuser     = var.db_user
    dbpass     = var.db_password
    dbname     = var.db_name
  })
  root_block_device {
    volume_size = var.vol_size
  }
}
