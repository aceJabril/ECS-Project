output "cluster_name" {
  description = "Outputs ECS cluster name"
  value       = aws_ecs_cluster.ecs_project_cluster.name
}

output "service_name" {
  description = "Outputs ECS service name"
  value       = aws_ecs_service.ecs_cluster_service.name
}
