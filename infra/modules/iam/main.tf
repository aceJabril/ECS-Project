resource "aws_iam_role" "iam_role_ecs" {
    name = "iam_role_ecs"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Principal = {
            Service = "ecs-tasks.amazonaws.com"
            }
        }
        ]

    })
    
    tags = {
        Name = "iam_role_ecs"
    }
  
}