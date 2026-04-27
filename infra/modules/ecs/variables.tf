variable "execution_role_arn" {
  description = "The ARN of the execution role for the ECS task"
  type        = string
}

variable "ecr_image_url" {
  description = "The URL of the ECR image to be used in the ECS task"
  type        = string
}

variable "subnet_id_1" {
  description = "The ID of the first subnet for the ECS service"
  type        = string
}

variable "subnet_id_2" {
  description = "The ID of the second subnet for the ECS service"
  type        = string
}

variable "ecs_service_sg" {
  description = "The security group for the ECS service"
  type        = string
}

variable "target_group_arn" {
  description = "The ARN of the target group for the load balancer"
  type        = string
}