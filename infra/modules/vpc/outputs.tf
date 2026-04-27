output "vpc_id" {
  value = aws_vpc.ecs_project.id
}

output "subnet_1_id" {
  value = aws_subnet.ecs_project_subnet_1.id
}

output "subnet_2_id" {
  value = aws_subnet.ecs_project_subnet_2.id
}

output "alb_sg_id" {
  description = "ALB SG ID"
  value       = aws_security_group.ecs-alb-sg.id
}

output "ecs_sg_id" {
  description = "ECS SG ID"
  value       = aws_security_group.ecs-sg.id
}

output "private_subnet_1_id" {
  value = aws_subnet.ecs_project_private_subnet_1.id
}

output "private_subnet_2_id" {
  value = aws_subnet.ecs_project_private_subnet_2.id
}