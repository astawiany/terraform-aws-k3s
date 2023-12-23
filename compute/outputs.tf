output "ssh_access_command" {
  value = [for i in aws_instance.tf_node : join("", ["Instance(s) details: ","ubuntu@", i.public_dns])]
}

output "target_group_port" {
  value = aws_alb_target_group_attachment.tf_tg_attachment[0].port
}