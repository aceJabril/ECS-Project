resource "aws_ecr_repository" "ecs_project_ecr" {
    name = "ecs_project_ecr"
    image_tag_mutability = "IMMUTABLE"

    encryption_configuration {
        encryption_type = "AES256"
    }

    tags = {
        Name = "ecs_project_ecr"
    }
}