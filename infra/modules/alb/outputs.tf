output "alb_arn" {
    description = "Outputs ALB arn"
    value = aws_lb.ecs-lb.arn
}  

output "target_group_arn" {
    description = "Outputs target group arn"
    value = aws_lb_target_group.ecs-tg.arn
}

output "alb_dns_name" {
    description = "Outputs ALB DNS name"
    value = aws_lb.ecs-lb.dns_name
}