resource "aws_ecr_repository" "ecs_project_ecr" {
    name = "ecs-project"
    image_tag_mutability = "MUTABLE"
    force_delete = true

    encryption_configuration {
        encryption_type = "AES256"
    }

    tags = {
        Name = "ecs_project_ecr"
    }
}