variable "vpc_id" {
    description = "The ID of the VPC"
    type        = string
}

variable "subnet_id_1" {
    description = "The ID of the first subnet"
    type        = string
}

variable "subnet_id_2" {
    description = "The ID of the second subnet"
    type        = string
}

variable "ecs_alb_sg" {
    description = "The security group for the ALB"
    type        = string
}

variable "certificate_arn" {
  description = "ACM certificate ARN"
  type        = string
}