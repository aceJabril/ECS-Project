resource "aws_lb" "ecs-lb" {
    name               = "ecs-lb-tf"
    internal           = false
    load_balancer_type = "application"
    security_groups    = [var.ecs_alb_sg]
    subnets            = [var.subnet_id_1, var.subnet_id_2]

    
    enable_deletion_protection = false

    
    tags = {
        Environment = "production"
    }
}
resource "aws_lb_target_group" "ecs-tg" {
        name     = "ecs-tg-tf"
        port     = 80
        protocol = "HTTP"
        vpc_id   = var.vpc_id
        target_type = "ip"


        health_check {
            path                = "/health"
            protocol            = "HTTP"
            matcher             = "200-399"
            interval            = 30
            timeout             = 5
            healthy_threshold   = 3
            unhealthy_threshold = 3
        }

        tags = {
            Environment = "production"
        }
    }


resource "aws_lb_listener" "ecs-listener" {
        load_balancer_arn = aws_lb.ecs-lb.arn
        port              = 80
        protocol          = "HTTP"

        default_action {
            type             = "forward"
            target_group_arn = aws_lb_target_group.ecs-tg.arn
        }
    }
  
