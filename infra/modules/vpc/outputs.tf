output "vpc_id" {
  value = aws_vpc.ecs_project.id
}

output "subnet_1_id" {
    value =aws_subnet.ecs_project_subnet_1.id
}

output "subnet_2_id" {
    value =aws_subnet.ecs_project_subnet_2.id
}