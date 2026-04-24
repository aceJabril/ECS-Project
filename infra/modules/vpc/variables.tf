variable "cidr_block" {
    description = "The CIDR block for the VPC."
    type        = string
    default     = "10.0.0.0/16"
}

variable "az_1" {
    description = "The availability zone for subnet 1"
    type        = string
    default     = "eu-west-2a"
}

variable "az_2" {
    description = "The availability zone for subnet 2"
    type        = string
    default     = "eu-west-2b"
}

variable "subnet_cidr_block_1" {
    description = "The CIDR blocks for the subnets"
    type        = string
    default     = "10.0.1.0/24"
}


variable "subnet_cidr_block_2" {
    description = "The CIDR blocks for the subnets."
    type        = string
    default     = "10.0.2.0/24"
}


variable "private_subnet_cidr_block_1" {
  description = "CIDR block for private subnet 1"
  type        = string
}

variable "private_subnet_cidr_block_2" {
  description = "CIDR block for private subnet 2"
  type        = string
}
