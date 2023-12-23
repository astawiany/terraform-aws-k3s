output "lb_target_group_arn" {
  value = aws_lb_target_group.tf_alb_tg.arn
}

output "alb_endpoint" {
  value = aws_lb.tf_lb.dns_name
}