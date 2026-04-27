output "ecr_repo_url" {
  value = aws_ecr_repository.ecs_project_ecr.repository_url
}