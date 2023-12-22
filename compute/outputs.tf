output "ssh_access_command" {
  value = [for i in aws_instance.tf_node : join("", ["Instance(s) details: ","ubuntu@", i.public_dns])]
}