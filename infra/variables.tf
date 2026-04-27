variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "subnet_cidr_block_1" {
  description = "The CIDR block for subnet 1"
  type        = string
}

variable "subnet_cidr_block_2" {
  description = "The CIDR block for subnet 2"
  type        = string
}

variable "az_1" {
  description = "The availability zone for subnet 1"
  type        = string
}

variable "az_2" {
  description = "The availability zone for subnet 2"
  type        = string
}

variable "domain" {
  description = "The domain name for the ACM certificate"
  type        = string
}

variable "private_subnet_cidr_block_1" {
  description = "CIDR block for private subnet 1"
  type        = string
}

variable "private_subnet_cidr_block_2" {
  description = "CIDR block for private subnet 2"
  type        = string
}

