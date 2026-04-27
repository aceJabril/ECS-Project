resource "aws_ecs_cluster" "ecs_project_cluster" {
  name = "ecs-project-cluster"
}

resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                   = "ecs-project-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = var.execution_role_arn
  container_definitions = jsonencode([
    {
      name  = "ecs-project-container"
      image = var.ecr_image_url
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
          protocol      = "tcp"
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "/ecs/ecs-project"
          awslogs-region        = "eu-west-2"
          awslogs-stream-prefix = "ecs"
        }
      }
    }
  ])
}

resource "aws_ecs_service" "ecs_cluster_service" {
  name            = "ecs_project_service"
  cluster         = aws_ecs_cluster.ecs_project_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task_definition.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = [var.subnet_id_1, var.subnet_id_2]
    security_groups  = [var.ecs_service_sg]
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "ecs-project-container"
    container_port   = 80
  }
}

resource "aws_cloudwatch_log_group" "ecs_logs" {
  name              = "/ecs/ecs-project"
  retention_in_days = 7

  tags = {
    Name = "ecs-project-logs"
  }
}