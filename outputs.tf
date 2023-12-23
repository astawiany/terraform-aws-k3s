output "instance_access" {
  value = module.compute.ssh_access_command
}

output "load_balancer_endpoint" {
  value = module.loadbalancing.alb_endpoint
}

output "target_group_port" {
  value = module.compute.target_group_port
}